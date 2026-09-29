select category, sum(amount)
from cost_allocs
group by category;
