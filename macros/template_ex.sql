{% macro template_ex() %}
    {% set query %}
        select true as bool      
    {% endset %}

    /* When SQL is actually run, it will run the set function above 
        and output it to a table to be used in another call as needed 
        In this case, we know that there is only 1 column and 1 value
        so we can hardcode this. */
    {% if execute %}
        {% set results = run_query(query).columns[0].values()[0] %}
        /* Log statement added as best practice to tell future self what's happening
            ~ is a contenate operator
            info=True actually prints the log
            The statement is taking the set variable "results" and concatenating it with "SQL Results"
         */
        {{ log("SQL results " ~ results, info=True )}}

        /* Using the output of set variable "results", which is the output of 
            other set variable "query". */
        select 
            {{ results }} as is_real
        from ex_table

    {% endif %}
  
{% endmacro %}