Ruby Partial Generator (With Pure Data Additive Synthesiser)
------------------------------------------------------------
Andrew Faraday
--------------


This is a technical test of ruby as a partial generator for Pure Data. It's just a proof of concept at the moment but one day it might grow up into part of a much biggger project. 

Why use it?
-----------

Several times in my life, I've set out to make an additive synthesizer in Pure Data and gone through this process:

* Set up an array with sinesum 
* Googled methods of generating partials
* Found the floss manual again (http://en.flossmanuals.net/pure-data/audio-tutorials/generating-waveforms/)
* Spent quite a lot of time working out the numbers for one or other of these waveforms and typing it in to a message in Pd
* Eventually, get on with my Pd patch

This bit of Ruby scripting automates the process.

What does it do
---------------

The script, waveform.rb generates a list of partials then generates the sinesum message for PureData (which instructs it to generate a waveform with these relative partial levels in an array). 

This message is sent to Pure Data via a TCP (network) port.

This can then be used (with the tabosc4~ object) to generate a tone.

A very simple PureData patch (ruby-waveforms.pd) is included to demonstrate this. 

Examples
--------

Try these examples, and watch the array 'waveform' to see the effect.

Before any example..

* Open Pure Data (downloadable from www.puredata.info)
* Open the patch ruby-waveforms.rb

In a terminal run one of these commands to produce a prescribed waveform:

`ruby waveform.rb triangle`
`ruby waveform.rb square 20`
`ruby waveform.rb saw 4`

This has two arguments, the shape of the waveform, and the number of partials being used. The more partials being used, the closer the waveform is to mathematically perfect. 

It is possible, instead of a named wave shape, to give it the actual equation which will generate your wave, where 'i' is the partial number. 

`ruby waveform.rb "1/i"`

There's also, for fun, a patch added which cycles through the three waveshapes and increases the number of partials on each, so you can see and hear the changing waveform. 

`ruby rotate-waveform.rb` 



Other
-----

More Pure Data tutorials, other technical prattle etc. at www.andrewfaraday.com

