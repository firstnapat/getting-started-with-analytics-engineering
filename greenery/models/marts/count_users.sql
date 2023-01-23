select
	count(distinct user_guid) as user_count

from {{ ref('stg_greenery__users') }}