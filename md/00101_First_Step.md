First Step
----------
A good starting point for working with Shoes is [the tutorial](http://shoooes.net/tutorial/) written by **\_why**.

If you want to experiment, you can copy and paste the 16 sample programs and run them one by one. Don't worry if you don't understand the code yet, just run it and see what happens to the app windows. Although the tutorial does have screenshots, running the samples and maybe playing around with them is a good start to Shoes programming. So do it now, it will help you a lot in understanding this tutorial you are reading right now.


For samples 1 - 4
-----------------
	# _why_sample1.rb
	Shoes.app { button "Push me" }


	# _why_sample2.rb
	Shoes.app {
	  stack {
	    button "A bed of clams"
	    button "A coalition of cheetahs"
	    button "A gulp of swallows"
	  }
	}


	# _why_sample3.rb
	Shoes.app {
	  background white
	  stack(:margin => 8) {
	    button "A bed of clams"
	    button "A coalition of cheetahs"
	    button "A gulp of swallows"
	  }
	}


	# _why_sample4.rb
	Shoes.app {
	  oval :left => 10, :top => 10,
	    :radius => 40
	}


**A Little Challenge**

- the { } brackets can be replaced with text
- using shoes built in help find out what they are and replace them see what is the difference?
- what will happen if sample 4 if you change the values for top and left?
- try using other shapes instead?
- what about have them so that they appear on screen at the same time?
- 1st in scripts by themselves then in 1 script

*Post your findings.*

**Note** any questions or problems post those as well as along with the error messages so we can see the error (we might not get the same error due to differing OSes or versions of OSes etc).


For additional script call it 4A
--------------------------------
**A Little Challenge**

- Using `alt` + `/` keys you get a debug screen pop up.
- Write a script that will put something to this window
- also use the alert built in function have it say something.
- Use info what does it do?

*Post your findings.*

**Note** any questions or problems post those as well as along with the error messages so we can see the error (we might not get the same error due to differing OSes or versions of OSes etc).


For Sample 5
------------
	# _why_sample5.rb
	Shoes.app {
	  fill red
	  rect :left => 10, :top => 10,
	    :width => 40
	  arrow :left => 30, :top => 60,
	    :width => 40
	}

**A Little Challenge**

- Try and figure out how you can RANDomly change either the colour used to fill in the arrow or the box.
- Why not have both randomly changing colours.

*Post your findings.*

**Note** any questions or problems post those as well as along with the error messages so we can see the error (we might not get the same error due to differing OSes or versions of OSes etc).


For Sample 6
------------
	# _why_sample6.rb
	Shoes.app {
	  image "http://shoooes.net/images/nks-kidnap.png"
	}

**A Little Challenge**

- choose another image be it local to your PC or somewhere else

*Post your findings.*

**Note** any questions or problems post those as well as along with the error messages so we can see the error (we might not get the same error due to differing OSes or versions of OSes etc).


For sample 7
------------
	# _why_sample7.rb
	Shoes.app {
	  para strong("Q."), " Are you beginning to grasp hold of Shoes?"
	}

**A Little Challenge**

- how can you change the text easily either font, size, or colour? <br>
  to find answers use shoes built in help.
- how would you put a boarder on the window?
- write a script that shows how this can be done?

Suggestion start with one line per script then when you have this done put them into one script. if your really confindant do it all in one scrip.

*Post your findings.*

**Note** any questions or problems post those as well as along with the error messages so we can see the error (we might not get the same error due to differing OSes or versions of OSes etc).


For sample 8
------------
	# _why_sample8.rb
	Shoes.app {
	  stack(:margin => 6) {
	    title "A Question"
	    para strong("Q."), " Are you beginning to grasp hold of Shoes?"
	    para em(strong("A."), " Quit pestering me, I'm hacking here.")
	  }
	}

**A Little Challenge**

- explore what other built in functions shoes have for highlighting text show some examples 

*Post your findings.*

**Note** any questions or problems post those as well as along with the error messages so we can see the error (we might not get the same error due to differing OSes or versions of OSes etc).


For sample 9
------------
	# _why_sample9.rb
	Shoes.app {
	  @push = button "Push me"
	  @note = para "Nothing pushed so far"
	}

**A Little Challenge**

Can you activate the button from the keyboard? (using shortcuts Like you can in windows)

What about setting up other buttons that become active or visible once the text appear that will change or toggle each effect when clicked eg one click makes the text bold same button 2nd time turns bold off.

Ideas:

- changes the font of the text (perhaps have a selection - say 4 and they get cycled through)
- changes the font size.
- puts text to italic, underline, superscript or subscript, line through
- buttons that use built in functions (ie title, subtitle etc) as another option

*Post your findings.*

**Note** any questions or problems post those as well as along with the error messages so we can see the error (we might not get the same error due to differing OSes or versions of OSes etc).


For sample 10
-------------
	# _why_sample10.rb
	Shoes.app {
	  @push = button "Push me"
	  @note = para "Nothing pushed so far"
	
	  @push.click {
	    @note.replace "Aha! Click!"
	  }
	}

**A Little Challenge**

- figure out how you detect which button is pressed, give feed back to the user so they know which button they pressed.
- Can you use the keyboard as with windows how do you capture them?

*Post your findings.*

**Note** any questions or problems post those as well as along with the error messages so we can see the error (we might not get the same error due to differing OSes or versions of OSes etc).


For sample 11
-------------
	# _why_sample11.rb
	Shoes.app do
	  background "#F3F".."#F90"
	  title "Shoooes", :top => 60,
	    :align => "center",
	    :font => "Trebuchet MS",
	    :stroke => white
	  end
	  

**A Little Challenge**

- the bacground function uses hex codes replace them for something more meaningful.
- How many meaningful colours are there?
- how easy is it to alter the alignment?
- what happens if you also use margin, left and right just after the top statement?

*Post your findings.*

**Note** any questions or problems post those as well as along with the error messages so we can see the error (we might not get the same error due to differing OSes or versions of OSes etc).

For sample 12
-------------
	# _why_sample12.rb
	Shoes.app do
	  background "#EFC"
	  border "#BE8", :strokewidth => 6
	  stack(:margin => 12) do
	    para "Enter your name"
	    flow do
	      edit_line
	      button "OK"
	    end
	  end
	end

**A Little Challenge**

- alter this program so that it asks for a name address phone number.
- get the program to do the following things .....
        + have the details displayed on the debug screen.
        + display the user entry on the main window.
        + save the text entered to a file.
        + "clear" the window and display the text as read from the file you've just created.

*Post your findings.*

**Note** any questions or problems post those as well as along with the error messages so we can see the error (we might not get the same error due to differing OSes or versions of OSes etc).


For Sample 13
-------------
	# _why_sample13.rb
	Shoes.app do
	  @shape = star :points => 5
	  motion do |left, top|
	    @shape.move left, top
	  end
	end

**A Little Challenge**

- write two scripts....
        + To start/stop movement when mouse button is clicked.
        + create 4 shapes and randomly have them start/stop when mouse button is clicked.

- object here is to have an oject move where ever mouse is on screen, 1 click stops the object moving, another click starting movement again thus you can move the cursor to another place on the screen without the shape following.

*Post your findings.*

**Note** any questions or problems post those as well as along with the error messages so we can see the error (we might not get the same error due to differing OSes or versions of OSes etc).


For sample 14
-------------
	# _why_sample14.rb
	Shoes.app do
	  @shoes = image "http://shoooes.net/shoes.png",
	    :top => 100, :left => 100
	  animate do |i|
	    @shoes.top += (-20..20).rand
	    @shoes.left += (-20..20).rand
	  end
	end

**A Little Challenge**

- at times the image goes outside the boundaries of the screen, edit the script so this doesn't happen

*Post your findings.*

**Note** any questions or problems post those as well as along with the error messages so we can see the error (we might not get the same error due to differing OSes or versions of OSes etc).


For sample 15
-------------
	# _why_sample15.rb
	Shoes.app {
	  @poem = stack {
	    para " 
	My eyes have blinked again
	And I have just realized
	This upright world 
	I have been in.
	
	My eyelids wipe
	My eyes hundreds of times
	Reseting and renovating
	The scenery."
	  }
	
	  para(link("Clear").
	    click { @poem.clear })
	}

**A Little Challenge**

- play with the text, using built in functions to show how the effects are on screen

*Post your findings.*

**Note** any questions or problems post those as well as along with the error messages so we can see the error (we might not get the same error due to differing OSes or versions of OSes etc).


For sample 16
-------------
	# _why_sample16.rb
	Shoes.app(:width => 300,
	  :height => 400) {
	  fill rgb(0, 0.6, 0.9, 0.1)
	  stroke rgb(0, 0.6, 0.9)
	  strokewidth 0.25
	  100.times {
	    oval :left => (-5..self.width).rand,
	      :top => (-5..self.height).rand,
	      :radius => (25..50).rand
	  }
	}

**A Little Challenge**

- change things so you see the effects they have on screen, try other shapes.

*Post your findings.*

**Note** any questions or problems post those as well as along with the error messages so we can see the error (we might not get the same error due to differing OSes or versions of OSes etc).
