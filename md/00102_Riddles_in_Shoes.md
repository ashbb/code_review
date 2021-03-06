Riddles in Shoes
----------------

Let's look at the code for the exercise **Riddle in Shoes**.

- The full code is available on GitHub as
  [sample67.rb](http://github.com/ashbb/shoes_tutorial_html/blob/master/src/sample67.rb) on the GitHub. This documents references the line numbers from said file.
- Before reading this document, please watch [the demo](http://www.rin-shun.com/rubylearning/shoes/riddles_in_shoes.swf.html) created by CamStudio.

**sample67.png**

![sample67.png](http://github.com/ashbb/code_review/raw/master/img/sample67.png)

The **Riddles in Shoes** exercise can be completed in 5 easy steps:

1. Open Shoes Window
	- Window's width and height are both 400 pixel.
	- Can't resize.
	- Show your app name and revision number on the window's title bar.
	- Color the surface of the window with a horizontal gradation.
2. Lay out titles and elements
	- Show title 'Riddles in Shoes'.
	- Show a line under the title.
	- Show subtitles 'Question', 'Answer' and 'Score'.
	- Align 10 stars under the line.
3. Show a riddle and create an input answer area
	- Click a button to show a random riddle.
	- Use the provided riddles.
4. Move down the star
	- Click a button to smoothly move down a star for the question.
	- If the answer is correct, align the star bottom left.
	- If the answer is incorrect, align the star bottom right.
5. Play Riddles in Shoes
	- Finish the game after answering all riddles.
	- Decorate the surface to your taste.

Okay, let's start explaining the code step by step!

<br><br><hr color=green>

Step 1: Open Shoes Window
------------------------

- Window's width and height are both 400 pixel.

	Line 16. Use the `:width` and `:height` options.

- Can't resize.

	Line 16. Use the `:resizable` option.

- Show your app name and revision number on the window's title bar.

	Line 16. Use the `:title` option. The app name is `Riddles` and the revision number is `r0.5`. See the snapshot (sample67.png) to know the position of the window's title bar.

- Color the surface of the window with a horizontal gradation.

	Line 29. We use the background method to color the surface of our window. But the provided code uses a vertical instead of a horizontal gradation. Consult [sample 10](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00408_No.8_background.mdown) for use of the `:angle` option.


**Summary of Step 1:** Run the following snippet.

	# step1.rb
	Shoes.app :width => 400, :height => 400, :title => 'Step 1',
	          :resizable => false do
	  background crimson..gold, :angle => 90
	end

**step1.png**

![step1.png](http://github.com/ashbb/code_review/raw/master/img/step1.png)


**A Little Challenge**

- How many color methods dose Shoes define? <br>
  The answer can be found in the Shoes manual: [Colors List](http://help.shoooes.net/Colors.html).
- Use the constant `OPT` as the only one argument for Shoes.app. How do you define the `OPT`?
- How do you get Shoes name `Raisins` ? <br>
  The answer can be found in the below additional links.



<b>For more information</b>

- [00501 Open Shoes built-in manual and Shoes console window](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00501_Open_Shoes_built-in_manual_and_Shoes_console_window.mdown)
- [00502 Output messages on the Shoes console window](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00502_Output_messages_on_the_Shoes_console_window.mdown)
- [00505 Built-in Constants and methods](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00505_Built-in_Constants_and_methods.mdown)
- [00516 Classes List and Colors List](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00516_Classes_List_and_Colors_List.mdown)


<br><br><hr color=green>


Step 2: Lay out titles and elements
----------------------------------
- Show title 'Riddles in Shoes'.

	Line 30. Use the `title` method with the `:align` option.

- Show line under the title.

	Line 31. Use the `line` method with the `:strokewidth` option.

- Show subtitles 'Question', 'Answer' and 'Score'.

	Line 34, 38, 48. Use the `subtitle` method with the `:left` and `:top` options.

- Align 10 stars under the line.

	Line 32, 53. We use the `star` method for creating ten stars which we'll store in an array called `stars`. See the Shoes manual for more information: [Art for Slots](http://help.shoooes.net/Art.html)


**Summary of Step 2:** Run the following snippet.

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


**A Little Challenge**

- Why do the 10 stars have to be created at the end of the code (Line 53)? <br>
  Please bear with us for a while, you will understand once you see the final version of the game (sample67.rb). 
- sample67.rb is a simple example which has no `stack` and `flow`. If you want to try another approach to lay out elements, read the Shoes manual: [Slots](http://help.shoooes.net/Slots.html) and the below additional informations.


<b>For more information</b>

- [00402 No.1 para](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00402_No.1_para.mdown)
- [00403 No.2&3 stack and flow](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00403_No.2_3_stack_and_flow.mdown)


<br><br><hr color=green>

Step 3: Show a riddle and create an input answer area
----------------------------------------------------
- Click a button to show a random riddle.
- Use the provided [riddles](http://github.com/ashbb/code_review/blob/master/src/riddles.txt).

+ First, let's prepare the Riddles.	

	Line 2-13. Assign 10 lines (riddles) to the constant `Riddles`.

	Line 14. Assign 10 numbers (0-9) to the constant `Nums` by using the `Enumberable#sort_by` method.

+ Show a riddle at a time under the `Question`.

	Line 35. Create a tagline object and assign it to the instance variable `@q`. At first this is empty, so nothing will be displayed in our app's window.

	Line 36. Define the `set_riddle` method. It shows a new riddle everytime it is called. 

	Line 17-22. The `set_riddle` method has 4 lines (line 18-21), of which 2 (lines 19 and 21) are not needed so far. They will be explained later.

+ Create an input answer area.

	Line 39. Using the `edit_line` method, an edit\_line object is assigned to the instance variable `@you`. 

+ Click a button to show a riddle at random.

	Line 40. Here we use the `button` method with a block. When you click the button, it executes the code within the block. This block consists of 5 lines, of which only the `set_riddle` is needed for this step of the exercise.

+ A more detailed explanation of the `set_riddle` method.

	Line 18. Pick a number from the constant `Nums` and assign it to the instance variable `@num`. Although there is no benefit in using an instance variable over a local variable right now, there will be later as you will see in the next step.

	Line 20. Select the `@num`th riddle from `Riddles`, split question and answer and assign them to `@q.text` and `@a` respectively. The tagline object `@q` uses the `text=` setter method to replace the string displayed by the tagline.

**Summary of Step 3:** Run the following snippet.

	# step3.rb
	Riddles =<<-EOS
	What letter is a drink? --> t
	What has nothing but a head and a tail? --> coin
	What is it that by losing an eye has nothing left but a nose? \
	--> noise
	EOS
	Nums = (0..2).sort_by{rand}
	
	Shoes.app :width => 400, :height => 400 do
	  def set_riddle
	    num = Nums.pop
	    @q.text, = Riddles.to_a[num].split(' --> ')
	  end
	  
	  @q = tagline '', :left => 20, :top => 130, :width => 360,
	               :stroke => green
	  @you = edit_line :left => 20, :top => 310, :width => 200
	  button 'OK', :left => 225, :top => 310 do
	    set_riddle
	  end
	end
	  

**step3.png**

![step3.png](http://github.com/ashbb/code_review/raw/master/img/step3.png)


**A Little Challenge**

- If you want to create password fields, what style (option) should you use the `edit_line` method with? <br>
  The answer can be found in the below additional links.

- If you do not want the contents to be edited, hat style (option) should you use the `edit_box` method with? <br>
  The answer can be found in the below additional links.



<b>For more information</b>

- [00404 No.4 button](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00404_No.4_button.mdown)
- [00406 No.6 edit\_line](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00406_No.6_edit__line.mdown)
- [00526 The :state style](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00526_The__state_style.mdown)
- [00536 edit_line with block](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00536_edit_line_with_block.mdown)


<br><br><hr color=green>

Step 4: Move down the star
-------------------------
- Click a button to smoothly move down a star for the question.

	Line 41. Assign the number of the appropriate star  to the local variable `s`. To get this number for the current question we use the instance variable `@num`.

	Line 42. Use the method `animate` to repeat the block. See Shoes manual: [Element Creation](http://help.shoooes.net/Element.html).

	Line 43. Use the method `move` to move down the star smoothly. See Shoes manual: [Common Methods](http://help.shoooes.net/Common.html).

	Line 44. When the star moves and gets to its position 320 pixels away from the top edge, the animation loop will be stopped (the animate object will be removed) and we execute the `set_score` and `set_riddle` methods.

- If the answer is correct, align the star bottom left.
- If the answer is incorrect, align the star bottom right.

	Line 24-27. Defining the `set_score` method to move the star to the appropriate position. The instance variables `@i` and `@j` are used to hold the position at the end of the line.

	See the next step about lines 19 and 21 of the `set_riddle` method.

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


**A Little Challenge**

- What is the difference between `animate` and `every` ?

- Start something with initial conditions, then stop and restart the same thing with other conditions. ... What shall I do? <br>
  The answer can be found in the below additional links.



<b>For more information</b>

- [00517 start, stop and restart](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00517_start,_stop_and_restart.mdown)
- [00519 arc and cap](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00519_arc_and_cap.mdown)
- [00539 class definition outside of Shoes.app block](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00539_class_definition_outside_of_Shoes.app_block.mdown)


<br><br><hr color=green>

Step 5: Play Riddles in Shoes
----------------------------
- Finish the game after answering all riddles.

	Line 19. If `@num` is nil, open the `alert` mini window. Then `exit` the game.

- Decorate the surface to your taste.

	Line 21. Clear input area.

	Line 49, 50. Show `good job` and `how unlucky`.

**Summary of Step 5:** Run the [sample67.rb](http://github.com/ashbb/shoes_tutorial_html/blob/master/src/sample67.rb).


**A Little Challenge**

- The methods you don't attach them with a dot. ... What do you call them? <br>
  The answer can be found in the Shoes manual: [Built-in Methods](http://help.shoooes.net/Built-in.html)

- Why do the 10 stars have to be created at the end of the code (Line 53), again? <br>
  The answer can be found in the below additional links.


<b>For more information</b>

- [00537 One way of layer manipulation](http://github.com/ashbb/shoes_tutorial_html/tree/master/mdowns/00537_One_way_of_layer_manipulation.mdown)


<br><br><hr color=red>


Fin!
----
We finished the 'Riddles in Shoes' exercise!

Let's enjoy Ruby programming with Shoes! :-D


