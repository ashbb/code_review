Riddles in Shoes
----------------

I'd like to try explaining the code of **Riddle in Shoes**.

- The code is [sample67.rb](http://github.com/ashbb/shoes_tutorial_html/blob/c80e826f21a68700d72d9de9e1fbd7556bc64471/src/sample67.rb) on the GitHub. I use the same line number in the blow explanation. e.g. Line 16-17
- At first, see [the demo](http://www.rin-shun.com/rubylearning/shoes/riddles_in_shoes.swf.html) created by CamStudio.

**sample67.png**

![sample67.png](http://github.com/ashbb/code_review/raw/master/img/sample67.png)

We can creat this program by the following 5 steps.

1. Open Shoes Window
	- Window's width and height are both 400 pixel.
	- Can't resize.
	- Show your app name and revision number on the window's title bar.
	- Color the surface of the window with a horizontal gradation.
2. Lay out titles and elements
	- Show title 'Riddles in Shoes'.
	- Show line under the title.
	- Show subtitles 'Question', 'Answer' and 'Score'.
	- Align 10 stars under the line.
3. Show a riddle and create an input answer area
	- Click a button to show a riddle at random.
	- Use these riddles.
4. Move down the star
	- Click a button to smoothly move down a star for the question.
	- If the answer is correct, align the star at the left-bottom.
	- If the answer is incorrect, align the star at the right-bottom.
5. Play Riddles in Shoes
	- Finish the game after answering all riddles.
	- Decorate the surface to your taste.

Okay, let's start explaining the code step by step!


<br><br><hr color=green>


Step1: Open Shoes Window
------------------------

- Window's width and height are both 400 pixel.

	Line 16. Using `:width` and `:height` options.

- Can't resize.

	Line 16. Using `:resizable` option.

- Show your app name and revision number on the window's title bar.

	Line 16. Using `:title` option. The app name is `Riddles` and revision number is `r0.5`. See the snapshot (sample67.png) to know the position of window's title bar.

- Color the surface of the window with a horizontal gradation.

	Line 29. Using background method to color the surface of the window. But this code doesn't show the way to create a horizontal gradation. 
I's a vertical gradation. See [sample 10](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00408_No.8_background.mdown). You can find `:angle` option.

	How many color methods dose Shoes define? See Shoes manual: [Colors List](http://help.shoooes.net/Colors.html).

**Summary of Step1:** Run the following snippet.

	# step1.rb
	Shoes.app :width => 400, :height => 400, :title => 'Step 1', :resizable => false do
	  background crimson..gold, :angle => 90
	end

**step1.png**

![step1.png](http://github.com/ashbb/code_review/raw/master/img/step1.png)

<br><br><hr color=green>


Step2: Lay out titles and elements
----------------------------------
- Show title 'Riddles in Shoes'.

	Line 30. Using `title` method with `:align` option.

- Show line under the title.

	Line 31. Using `line` method with `:strokewidth` option.

- Show subtitles 'Question', 'Answer' and 'Score'.

	Line 34, 38, 48. Using `subtitle` method with `:left` and `:top` option.

- Align 10 stars under the line.

	Line 32, 53. Using `star` method to creat a star ten times. They are stored to the Array `stars`. See Shoes manual: [Art for Slots](http://help.shoooes.net/Art.html)

	Why do the 10 stars have to create at the end of code (Line 53)? .... You can understand if you play the final version (sample67.rb). Please wait a little. ;-)

**Summary of Step2:** Run the following snippet.

	# step2.rb
	Shoes.app :width => 400, :height => 400 do
	  title 'Title', :align => 'center'
	  line 10, 55, 380, 55, :strokewidth => 10
	  subtitle 'Subtitle1', :left => 10, :top => 200
	  subtitle 'Subtitle2', :left => 10, :top => 250
	  10.times{|i| star(100+ 30*i, 80, 12, 10, 7)}
	end


**step2.png**

![step2.png](http://github.com/ashbb/code_review/raw/master/img/step2.png)

<br><br><hr color=green>


Step3: Show a riddle and create an input answer area
----------------------------------------------------
- Click a button to show a riddle at random.
- Use these riddles.

For details.
+ At first, prepare Riddles.	

	Line 2-13. Assign 10 lines (riddles) to `Riddles` constant.

	Line 14. Assign 10 numbers (0-9) to `Nums` constant at random by using `sort_by` method.

+ Show a riddle at a time under the `Question`.

	Line 35. Create a tagline object and assign it to `@q` instance variable. At first, it is empty. So, nothing will be shown on the Shoes window.

	Line 36. Define `set_riddle` method. It works to show the next riddle everytime when it is called. 

	Line 17-22. `set_riddle` method has 4 lines (line 18-21). but 2 lines (19, 21) are no need so far. They are explained later.

+ Creat an input answer area.

	Line 39. Using `edit_line` method. A edit\_line object is assigned to `@you` instance variable. 

+ Click a button to show a riddle at random.

	Line 40. Using `button` method with block. When you click the button, it execute the lines within the block. This button has 5 lines within the block. But all lines are no need so far except `set_riddle`.

+ Add a little explanation about `set_riddle`

	Line 18. Pick up a number from `Nums` constant and assign it to `@num` instance variable. Why using instance variable instead of local variable? There is no need to use instance variable so far. See the next step.

	Line 20. Select the `@num`th riddle from `Riddle` and split a question and an answer and assign them to `@q.text` and `@a`. The tagline object `@q` has `text=` setter method to replace the string of tagline.

**Summary of Step3:** Run the following snippet.

	# step3.rb
	Riddles =<<-EOS
	What letter is a drink? --> t
	What has nothing but a head and a tail? --> coin
	What is it that by losing an eye has nothing left but a nose? --> noise
	EOS
	Nums = (0..2).sort_by{rand}
	
	Shoes.app :width => 400, :height => 400 do
	  def set_riddle
	    num = Nums.pop
	    @q.text, = Riddles.to_a[num].split(' --> ')
	  end
	  
	  @q = tagline '', :left => 20, :top => 130, :width => 360, :stroke => green
	  @you = edit_line :left => 20, :top => 310, :width => 200
	  button 'OK', :left => 225, :top => 310 do
	    set_riddle
	  end
	end
	  

**step3.png**

![step3.png](http://github.com/ashbb/code_review/raw/master/img/step3.png)

<br><br><hr color=green>


Step4: Move down the star
-------------------------
- Click a button to smoothly move down a star for the question.

	Line 41. Assign the appropriate number of stars to local variable `s`. To get the appropriate number of stars for the current question, use instance variable `@num`.

	Line 42. Using `animate` method to repeat the block. See Shoes manual: [Element Creation](http://help.shoooes.net/Element.html).

	Line 43. Using `move` method to move down smoothly. See Shoes manual: [Common Methods](http://help.shoooes.net/Common.html).

	Line 44. When the star moves down to the position 320pixel away from the top edge, the animation loop will be stopped (the animate object will be removed). Then will execute the `set_score` method and `set_riddle` methods.

- If the answer is correct, align the star at the left-bottom.
- If the answer is incorrect, align the star at the right-bottom.

	Line 24-27. Defining the `set_score` method to move the star to the appropriate position. The instance variable `@i` and `@j` are using to hold the position at the end of the line.

	See the next step about the `set_riddle` method Line 19 and 21.

**Summary of Step4:** Run the following snippet.

	# step4.rb
	Shoes.app :width => 400, :height => 400 do 
	  stars = []
	  10.times{|i| stars << star(100+ 30*i, 80, 12, 10, 7)}
	  
	  button 'OK', :left => 225, :top => 310 do
	    s = stars[rand(10)]
	    a = animate do |i|
	      s.move s.left, s.top + i
	      a.remove if s.top > 320
	    end
	  end
	end

**step4.png**

![step4.png](http://github.com/ashbb/code_review/raw/master/img/step4.png)

<br><br><hr color=green>


Step5: Play Riddles in Shoes
----------------------------
- Finish the game after answering all riddles.

	Line 19. If `@num` is nil, open the `alert` mini window. Then `exit` the game.

- Decorate the surface to your taste.

	Line 21. Clear input area.

	Line 49, 50. Show `good job` and `how unlucky`.


<br><br><hr color=red>


That's a wrap.
--------------
Let's enjoy Ruby programming with Shoes! :-D


