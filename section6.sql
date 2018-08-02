/*
Run file: source section6.sql
*/

/*
1. create a new database shirts_db
2. create a new table called SHIRTS
shirt_id	article	    color	    shirt_size	last_worn
1	        t-shirt	    white	      S	        10
2	        t-shirt	    green	      S	        200
3	        polo-shirt  black   	  M	        10
4	        tank top    blue	      S	        50
5	        t-shirt	    pink	      S	        0
6	        polo-shirt  red	        M	        5
7	        tan top     white	      S	        200
8	        tank top    blue	      M	        15

3. you can just copy the data below:
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15)

4. add manually the ninth data: Purple polo shirt, size M last worn 50 days ago

    QUERY TASK:
1. Only print out article and color
2. Print out everything except shirt_id
3. Change all polo shirts size to L
4. if last worn is 15 days ago, change it to 0
5. change all white shirts SIZE to "xs" and color to "off white"
6. delete all shirts last worn over 200 days ago
7. delete all tank tops
8. delete all shirts
9. drop the table
*/