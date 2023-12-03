create database soccer_dataset;
use soccer_dataset;

/* 8. From the following table, write a SQL query to count the
 number of matches ended with a results in-group stage.*/

select count(*) from match_mast 
where results = 'win' and play_stage = 'G';

/* 9. From the following table, write a SQL query to find the number
 of matches that resulted in a penalty shootout. */
 
 select count(distinct match_no) from penalty_shootout;
 
 /* 10. From the following table, write a SQL query to find number 
 of matches decided by penalties in the Round 16. */
 
 select count(distinct p.match_no) as No_of_Matches from penalty_shootout p
 inner join match_mast m
 on p.match_no = m.match_no
 where m.play_stage = 'R';
 
 /* 11. From the following table, write a SQL query to find the number of goals
 scored in every match within a normal play schedule. Sort the result-set on match number. 
 Return match number, number of goal scored. */
 
 select match_no, count(goal_id) as No_of_goals
 from goal_details
 where goal_schedule = 'NT'
 group by 1
 order by 1;
 
 /* 12. From the following table, write a SQL query to find the matches in which no stoppage 
 time was added during the first half of play. Return match no, date of play, and goal scored. */
 
 select match_no, play_date, goal_score 
 from match_mast
 where stop1_sec = 0;
 
 /* 13. From the following table, write a SQL query to count the number of matches that ended 
 in a goalless draw at the group stage. Return number of matches. */
 
 select count(distinct match_no) as No_of_match from match_details
 where play_stage = 'G' and win_lose = 'D' and goal_score = 0;

 /* 14. From the following table, write a SQL query to calculate the number of matches that 
 ended in a single goal win, excluding matches decided by penalty shootouts. Return number of matches. */
 
 select count(distinct match_no) from match_details
 where win_lose = 'W' and goal_score = 1 and penalty_score = '';
 
/* 15. From the following table, write a SQL query to count the number of players replaced 
in the tournament. Return number of players as "Player Replaced". */

select count(player_id) as Player_Replaced from player_in_out
where in_out = 'O';

/* 18. From the following table, write a SQL query to count the number of players who were 
replaced during the first half. Return number of players as "Player Replaced". */

select count(player_id) as Player_Replaced from player_in_out
where in_out = 'O' and play_half = 1;

/* 19. From the following table, write a SQL query to count the total number of goalless 
draws played in the entire tournament. Return number of goalless draws. */

select count(distinct match_no) from match_details
where win_lose = 'D' and goal_score = 0 ;

/* 20. From the following table, write a SQL query to calculate the total number of 
players who were replaced during the extra time.  */

select count(player_id) as Player_Replaced from player_in_out
where in_out = 'O' and play_schedule = 'ET';

/* 21. From the following table, write a SQL query to count the number of substitutes 
during various stages of the tournament. Sort the result-set in ascending order by play-half,
 play-schedule and number of substitute happened. Return play-half, play-schedule, 
 number of substitute happened.  */
 
 select play_half, play_schedule, count(player_id) as No_of_Substitutes from player_in_out
where in_out = 'I'
group by 1,2
order by 1,2,3;

/* 25. From the following table, write a SQL query to find the players with shot numbers 
they took in penalty shootout matches. Return match_no, Team, player_name, jersey_no, 
score_goal, kick_no.  */

select p1.match_no, s1.country_name, m1.player_name, m1.jersey_no, p1.score_goal, p1.kick_no
from penalty_shootout p1
left join soccer_country s1 on p1.team_id = s1.country_id
left join player_mast m1 on p1.team_id = m1.team_id;

/* 26. From the following table, write a SQL query to count the number of penalty shots taken 
by each team. Return country name, number of shots as "Number of Shots".  */

select s1.country_name, count(p1.kick_id) as `Number of Shots` 
from penalty_shootout p1
left join soccer_country s1 
on p1.team_id = s1.country_id
group by 1
order by 2 desc;

/* 27. From the following table, write a SQL query to count the number of bookings in each half of play 
within the normal play schedule. Return play_half, play_schedule, number of booking happened.  */

select play_half, play_schedule, count(booking_time) as `Number of booking`
from player_booked
where play_schedule = 'NT'
group by 1,2;

/* 28. From the following table, write a SQL query to count the number of bookings during stoppage time. */

select count(booking_time) as `Number of booking`
from player_booked
where play_schedule = 'ST';

/* 29. From the following table, write a SQL query to count the number of bookings that happened in extra time.*/

select count(booking_time) as `Number of booking`
from player_booked
where play_schedule = 'ET';

--------------------------------------------------------------------------------------------------------------


/* 2. From the following tables, write a SQL query to find the winner of EURO cup 2016. Return country name.*/

