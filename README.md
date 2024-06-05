<h1><span style="color:#2d7eea">README - Your LookML PoP Project</span></h1>

<h2><span style="color:#2d7eea">LookML Overview</span></h2>


What challenges are they facing now?
 * Creating objects to solve each PoP within one table. Over excessive coding.
 * Not being able to recreate to other tables due not being able to scale.
   

What is the project goal that we are trying to achieve?

 * Make LookML more readable
 * Make Lookml more scalable
 * Able to add PoP over other tables
 * Have the posability to have predefined periods or range of dates within one explore
 * Being able to add new period types faster(YoY, MoM etc)
 * Add years to compare faster

<h2><span style="color:#2d7eea">Let's begin</span></h2>

What this proyect will need:
 1. A Period table in you WH
 2. A layer arquitecture in Looker
 3. Knowledge in liquid variables, refiments and extensions

<h2></h2>


   1. Period Table

   I have seen this in other retail companies but I decided to reduce the amount of work to maintain it. It goes like this:
   
PoP        |ini_c     |fin_c     |ini_p     |fin_p     
-----------|----------|----------|----------|----------
YoY        |2024-01-01|2024-04-29|2023-01-01|2023-04-29
MoM        |2024-04-01|2024-04-29|2023-04-01|2023-04-29
Same day ly|2024-04-29|2024-04-29|2023-04-24|2023-04-24
First Q    |2024-01-01|2024-03-31|2023-01-01|2023-03-31
Second Q   |2024-04-01|2024-06-30|2023-04-01|2023-06-30

Where _c_ stands for current and _p_ past. If you want to add a 3rd year of comparison, you will need to add two more **columns**. With a daily process you can keep this table up-to-date.

 ***i. Change the column name PoP to another. Looker didnt like it. It changed it to P_op.***

   2. Check documentation of the type of architecture
      
   https://www.spectacles.dev/blog/how-to-fix-your-lookml-project-structure

  <h3> Folder 1_base</h3> 
  
  Folder **1_base** has auto generated views of my fact table and my Period_over_period table specified above.
   
<h3> Folder 2_standard</h3>

   Folder **2_standard** has very few modification of the auto-generated views.
   
* Refined both views
* Hidden dimensions
* Add timeframes to my table to that the user to use when comparing
* Added the column _PoP_ as filter on my Period_over_period view. This filter will allways needs to filter the Period_over_period table to not cause a 
 cartesian explosion.
 
 Thus:
 
` sql:  {% condition period_defined_filter %} ${Period} {% endcondition %};;`

<h3> Folder 3_logical</h3>

   Folder **3_logical**.sales_periods_base

   Here is where most things happen. I have created one base explore, where other business areas can rereuse. 

   For my fact table I have:
   1. Extended from the _2_standard_
   2. Added Parameter to select if it is a _Predefinded PoP- or a _Range_
   3. A filter type datetime for when the user selects _Range_ . Added a `sql: true ;;` so that it dosent really filter(`WHERE`) data but instead use it as a variable.
   4. Added one measure for each year to compare. So in this case: **Two**.

Each measure has this type of coding, which in general sence says that if the parameter is _Predefined PoP_ then select data that is in the range of **Period_over_period.ini_x** and **Period_over_period.fin_x**. If it is selected by _Range_ then select data between **start_date** and **end_date** of the range.

`code(   {% if sales_periods_base.type_of_filter._parameter_value == 'poppre' %}
            case when  ${TABLE}.date BETWEEN period_over_period.ini_c and period_over_period.fin_c
                 then ${TABLE}.state_bottle_cost end
        {% elsif sales_periods_base.type_of_filter._parameter_value == 'popran' %}
            case when  ( ${TABLE}.date) BETWEEN  {% date_start sales_periods_base.date_range_filter %} AND {% date_end sales_periods_base.date_range_filter %}
                 then ${TABLE}.state_bottle_cost else null end
        {% else %}
            null
        {% endif %}   ;;
        )`
   5.

 Folder **3_logical**.sales_periods_mkt_ext

 What is happening here is that I am extending **AGAIN** the explore 


   date time all tables / read all of the table / cannot overlap / may look like an error

How does this result translate to a dashboard?

The user will have to select within two options:

**1.** A predefined period

**2.** A range of dates

![image](https://github.com/rellech/PeriodOverPeriod_Looker/assets/142577522/570f4f98-3634-4974-bb2e-01d3d30859ed)






LookML is a data modeling language for describing dimensions, fields, aggregates and relationships based on SQL.

LookML is powerful because it:



- **Is all about reusability**: Most data analysis requires the same work to be done over and over again. You extract
raw data, prepare it, deliver an analysis... and then are never able touse any of that work again. This is hugely
inefficient, since the next analysis often involves many of the same steps. With LookML, once you define a
dimension or a measure, you continue to build on it, rather than having to rewrite it again and again.
- **Empowers end users**:  The data model that data analysts and developers create in LookML condenses and
encapsulates the complexity of SQL, it and lets analysts get the knowledge about what their data means out of
their heads so others can use it. This enables non-technical users to do their jobs &mdash; building dashboards,
drilling to row-level detail, and accessing complex metrics &mdash; without having to worry about what’s behind the curtain.
- **Allows for data governance**: By defining business metrics in LookML, you can ensure that Looker is always a
credible single source of truth.


The Looker application uses a model written in LookML to construct SQL queries against a particular database that
business analysts can [Explore](https://cloud.google.com/looker/docs/r/exploring-data) on. For an overview on the basics of LookML, see [What is LookML?](https://cloud.google.com/looker/docs/r/what-is-lookml)


