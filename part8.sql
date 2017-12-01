101 and (
	(select pin from pins where cc_number = 1111222233334444) < 10000
);
1st try: 10000 -> valid
2nd try: 5000 -> valid
3rd try: 2500 -> valid
4th try: 1250 -> invalid
5th try: 1875 -> invalid
6th try: 2188 -> invalid
7th try: 2344 -> invalid
8th try: 2422 -> valid
9th try: 2383 -> valid
10th try: 2364 -> invalid
11th try: 2374 -> valid
12th try: 2369 -> valid
13th try: 2367 -> valid
14th try: 2365 -> valid (answer is 2364)

PIN: 2364
