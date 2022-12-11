-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

select cf_id, backers_count
from campaign
where outcome = 'live'
order by backers_count desc

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

select cf_id,
COUNT(backer_id)
from backers
group by cf_id
order by COUNT(backer_id) desc


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT 
con.first_name,
con.last_name,
con.email,
(c.goal - c.pledged) AS Remaining_Goal_Amount

INTO email_contacts_remaining_goal_amount

FROM campaign c
LEFT JOIN contacts as con on (c.contact_id = con.contact_id)
where c.outcome = 'live'
order by remaining_goal_amount desc


-- Check the table

select * from email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 



-- Check the table


