select
  *,
  sum(metric_value) over (
    partition by department
    order by fiscal_year, fiscal_quarter
    range between unbounded preceding and current row
  ) as running_total
from employee_metrics
order by department, fiscal_year, fiscal_quarter;
