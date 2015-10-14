<comment>Created 2007 Jul 17 to 2007 Oct 30 (DJZ)</comment>
<comment>2007 Nov 12 (DJZ) Added several ladder logic diagrams</comment>
<comment>04213.eps stolen from Principles of Digital Computing chapter as 04454.eps.</comment>
<comment>04214.eps stolen from Principles of Digital Computing chapter as 04475.eps.</comment>
<comment>first circuit/ladder 04451</comment>
<comment>last circuit/ladder 04489</comment>
<comment>first table/equation 14164</comment>
<comment>last table/equation 14173</comment>
<comment>2014/02/01 corrections to 7-segment</comment>
<comment>2014/02/01 04474.png 04488.png freed-up, unused by this sml.</comment>

<chapter>
<chaptertitle>COMBINATIONAL LOGIC FUNCTIONS</chaptertitle>
<proofread>

<para><bold>Original author: David Zitzelsberger</bold></para>

<section>
<sectiontitle>Introduction</sectiontitle>

<index>Combinational logic</index>

<para>The term "combinational" comes to us from mathematics. In mathematics a
combination is an unordered set, which is a formal way to say that nobody cares
which order the items came in. Most games work this way, if you rolled dice one
at a time and get a 2 followed by a 3 it is the same as if you had rolled a 3
followed by a 2. With combinational logic, the circuit produces the same output
regardless of the order the inputs are changed.</para>

<index> Sequential logic</index>

<para>There are circuits which depend on the when the inputs change, these
circuits are called sequential logic. Even though you will not find the term
"sequential logic" in the chapter titles, the next several chapters will discuss
sequential logic.</para>

<para>Practical circuits will have a mix of combinational and sequential logic,
with sequential logic making sure everything happens in order and combinational
logic performing functions like arithmetic, logic, or conversion.</para>

<para>You have already used combinational circuits. Each logic gate discussed
previously is a combinational logic function. Let's follow how two NAND gate
works if we provide them inputs in different orders.</para>

<para>We begin with both inputs being 0.</para>

<para><image>04451.png</image></para> <comment>Pair of NAND gates with both inputs low</comment>

<para>We then set one input high.</para>

<para><image>04452.png</image></para> <comment>Pair of NAND gates, each with one (different) input high</comment>

<para>We then set the other input high.</para>

<para><image>04453.png</image></para> <comment>Pair of NAND gates with both inputs high</comment>

<para>So NAND gates do not care about the order of the inputs, and you will find
the same true of all the other gates covered up to this point (AND, XOR, OR,
NOR, XNOR, and NOT).</para>

</section>

<section>
<sectiontitle>A Half-Adder</sectiontitle>

<index>Half-adder</index>
<index>Two input adder</index>

<para>As a first example of useful combinational logic, let's build a device that
can add two binary digits together. We can quickly calculate what the answers
should be:</para>

<para><literal>
0 + 0 = 0          0 + 1 = 1          1 + 0 = 1          1 + 1 = 10<subscript>2</subscript>
</literal></para>

<index>Carry</index>

<para>So we well need two inputs (a and b) and two outputs. The low order output
will be called <SIGMA> because it represents the sum, and the high order output
will be called C<subscript>out</subscript> because it represents the carry
out.</para>

<para>The truth table is</para>

<para><image>14164.png</image></para> <comment>Half-adder truth table</comment>

<para>Simplifying boolean equations or making some Karnaugh map will produce the
same circuit shown below, but start by looking at the results. The <SIGMA>
column is our familiar XOR gate, while the C<subscript>out</subscript> column is
the AND gate. This device is called a half-adder for reasons that will make
sense in the next section.</para>

<para><image>04454.png</image></para> <comment>Half adder circuit</comment>

<para>or in ladder logic</para>

<para><image>04475.png</image></para> <comment>Half adder ladder</comment>

</section>

<section>

<sectiontitle>A Full-Adder</sectiontitle>

<index>Adder</index>
<index>Addition, binary</index>
<index>Binary addition</index>
<index>Full-adder</index>

<para>The half-adder is extremely useful until you want to add more that one
binary digit quantities. The slow way to develop a two binary digit adders would
be to make a truth table and reduce it. Then when you decide to make a three
binary digit adder, do it again. Then when you decide to make a four digit
adder, do it again. Then when ... The circuits would be fast, but development
time would be slow.</para>

<para>Looking at a two binary digit sum shows what we need to extend addition to
multiple binary digits.</para>

<para><literal>
<sp>          11
<sp>           11
<sp>           11
<sp>          ---
<sp>          110
</literal></para>

<index>Three input adder</index>

<para>Look at how many inputs the middle column uses. Our adder needs three
inputs; a, b, and the carry from the previous sum, and we can use our two-input
adder to build a three input adder.</para>

<index>Carry</index>

<para><SIGMA> is the easy part. Normal arithmetic tells us that if <SIGMA> = a +
b + C<subscript>in</subscript> and <SIGMA><subscript>1</subscript> = a + b, then
<SIGMA> = <SIGMA><subscript>1</subscript> + C<subscript>in</subscript>.</para>

<para><image>04455.png</image></para> <comment>Three-quarter adder circuit?</comment>

<para><image>04476.png</image></para> <comment>Three-quarter adder ladder?</comment>

<para>What do we do with C<subscript>1</subscript> and
C<subscript>2</subscript>? Let's look at three input sums and quickly
calculate:</para>

<para><literal>
C<subscript>in</subscript> + a + b = ?
0 + 0 + 0 = 0       0 + 0 + 1 =  1       0 + 1 + 0 =  1      0 + 1 + 1 = 10
1 + 0 + 0 = 1       1 + 0 + 1 = 10       1 + 1 + 0 = 10      1 + 1 + 1 = 11
</literal></para>

<para>If you have any concern about the low order bit, please confirm that the
circuit and ladder calculate it correctly.</para>

<para>In order to calculate the high order bit, notice that it is 1 in both
cases when a + b produces a C<subscript>1</subscript>. Also, the high order bit
is 1 when a + b produces a <SIGMA><subscript>1</subscript> and
C<subscript>in</subscript> is a 1. So We will have a carry when
C<subscript>1</subscript> OR (<SIGMA><subscript>1</subscript> AND
C<subscript>in</subscript>). Our complete three input adder is:</para>

<para><image>04456.png</image></para> <comment>Full adder circuit</comment>

<para><image>04477.png</image></para> <comment>Full adder ladder</comment>

<para>For some designs, being able to eliminate one or more types of gates can
be important, and you can replace the final OR gate with an XOR gate without
changing the results.</para>

<para>We can now connect two adders to add 2 bit quantities.</para>

<para><image>04457.png</image></para> <comment>Funky two-bit adder circuit</comment>

<para><image>04478.png</image></para> <comment>Funky two-bit adder ladder</comment>

<para>A<subscript>0</subscript> is the low order bit of A,
A<subscript>1</subscript> is the high order bit of A, B<subscript>0</subscript>
is the low order bit of B, B<subscript>1</subscript> is the high order bit of B,
<SIGMA><subscript>0</subscript>is the low order bit of the sum,
<SIGMA><subscript>1</subscript> is the high order bit of the sum, and
C<subscript>out</subscript> is the Carry.</para>

<para>A two binary digit adder would never be made this way. Instead the lowest
order bits would also go through a full adder.</para>

<para><image>04458.png</image></para> <comment>Two-bit adder circuit</comment>

<para></para> <comment>spacing</comment>

<para><image>04479.png</image></para> <comment>Two-bit adder ladder</comment>

<para>There are several reasons for this, one being that we can then allow a
circuit to determine whether the lowest order carry should be included in the
sum. This allows for the chaining of even larger sums. Consider two different
ways to look at a four bit sum.</para>

<para><literal>
<sp>          111            1<-+  11<+-
<sp>           0110             |  01  |  10
<sp>           1011             |  10  |  11
<sp>          -----          -  | ---- | ---
<sp>          10001          1  +-100<htmlo><sp></htmlo> +-101
</literal></para>

<comment>the strange looking htmlo sp htmlo markup above is to force it to look ok in the html version</comment>

<para>If we allow the program to add a two bit number and remember the carry for
later, then use that carry in the next sum the program can add any number of
bits the user wants even though we have only provided a two-bit adder. Small
PLCs can also be chained together for larger numbers.</para>

<para>These full adders can also can be expanded to any number of bits space
allows. As an example, here's how to do an 8 bit adder.</para>

<para><image>04459.png</image></para> <comment>Eight-bit adder circuit</comment>

<para>This is the same result as using the two 2-bit adders to make a 4-bit
adder and then using two 4-bit adders to make an 8-bit adder or re-duplicating
ladder logic and updating the numbers.</para>

<para><image>04460.png</image></para> <comment>Eight-bit adder explained</comment>

<para>Each "2+" is a 2-bit adder and made of two full adders. Each "4+" is a
4-bit adder and made of two 2-bit adders. And the result of two 4-bit adders is
the same 8-bit adder we used full adders to build.</para>

<para>For any large combinational circuit there are generally two approaches to
design: you can take simpler circuits and replicate them; or you can design the
complex circuit as a complete device.</para>

<para>Using simpler circuits to build complex circuits allows a you to spend
less time designing but then requires more time for signals to propagate through
the transistors. The 8-bit adder design above has to wait for all the
C<subscript><italic>x</italic>out</subscript> signals to move from
A<subscript>0</subscript> + B<subscript>0</subscript> up to the inputs of
<SIGMA><subscript>7</subscript>.</para>

<para>If a designer builds an 8-bit adder as a complete device simplified to a
sum of products, then each signal just travels through one NOT gate, one AND
gate and one OR gate. A seventeen input device has a truth table with 131,072
entries, and reducing 131,072 entries to a sum of products will take some
time.</para>

<para>When designing for systems that have a maximum allowed response time to
provide the final result, you can begin by using simpler circuits and then
attempt to replace portions of the circuit that are too slow. That way you spend
most of your time on the portions of a circuit that matter.</para>

</section>

<section>

<sectiontitle>Decoder</sectiontitle>

<index>Decoder</index>

<para>A decoder is a circuit that changes a code into a set of signals. It is
called a decoder because it does the reverse of encoding, but we will begin our
study of encoders and decoders with decoders because they are simpler to
design.</para>

<index>1-to-2 line decoder</index>
<index>Decoder, line</index>
<index>Line decoder</index>

<para>A common type of decoder is the line decoder which takes an n-digit binary
number and decodes it into 2<superscript>n</superscript> data lines. The
simplest is the 1-to-2 line decoder. The truth table is</para>

<para><image>14165.png</image></para> <comment>1-to-2 decoder truth table</comment>

<para>A is the address and D is the dataline. D<subscript>0</subscript> is NOT A
and D<subscript>1</subscript> is A. The circuit looks like</para>

<para><image>04461.png</image></para> <comment>1-to-2 decoder circuit</comment>

<para><image>04480.png</image></para> <comment>1-to-2 decoder ladder</comment>

<index>2-to-4 line decoder</index>

<para>Only slightly more complex is the 2-to-4 line decoder. The truth table
is</para>

<para><image>14166.png</image></para> <comment>2-to-4 decoder truth table</comment>

<para>Developed into a circuit it looks like</para>

<para><image>04462.png</image></para> <comment>2-to-4 decoder circuit</comment>

<para><image>04481.png</image></para> <comment>2-to-4 decoder ladder</comment>

<para>Larger line decoders can be designed in a similar fashion, but just like
with the binary adder there is a way to make larger decoders by combining
smaller decoders. An alternate circuit for the 2-to-4 line decoder is</para>

<para><image>04463.png</image></para> <comment>built up 2-to-4 line decoder circuit</comment>

<para>Replacing the 1-to-2 Decoders with their circuits will show that both
circuits are equivalent. In a similar fashion a 3-to-8 line decoder can be made
from a 1-to-2 line decoder and a 2-to-4 line decoder, and a 4-to-16 line decoder
can be made from two 2-to-4 line decoders.</para>

<para>You might also consider making a 2-to-4 decoder ladder from 1-to-2 decoder
ladders. If you do it might look something like this:</para>

<para><image>04482.png</image></para> <comment>built up 2-to-4 line decoder ladder</comment>

<para>For some logic it may be required to build up logic like this. For an
eight-bit adder we only know how to sum eight bits by summing one bit at a time.
Usually it is easier to design ladder logic from boolean equations or truth
tables rather than design logic gates and then "translate" that into ladder
logic.</para>

<para>A typical application of a line decoder circuit is to select among
multiple devices. A circuit needing to select among sixteen devices could have
sixteen control lines to select which device should "listen". With a decoder
only four control lines are needed.</para>

</section>

<section>

<sectiontitle>Encoder</sectiontitle>

<index>Encoder</index>

<para>An encoder is a circuit that changes a set of signals into a code. Let's
begin making a 2-to-1 line encoder truth table by reversing the 1-to-2 decoder
truth table.</para>

<para><image>14167.png</image></para> <comment>1-to-2 decoder reversed truth
table.</comment>

<para>This truth table is a little short. A complete truth table would be</para>

<para><image>14168.png</image></para> <comment>2-to-1 decoder with empty entries</comment>

<para>One question we need to answer is what to do with those other inputs? Do
we ignore them? Do we have them generate an additional error output? In many
circuits this problem is solved by adding sequential logic in order to know not
just what input is active but also which order the inputs became active.</para>

<index>7-segment encoder</index>
<index>Encoder, 7-segment</index>

<para>A more useful application of combinational encoder design is a binary to
7-segment encoder. The seven segments are given according</para>

<index>7-segment display</index>

<para><image>14169.png</image></para> <comment>7-segment display</comment>

<para>Our truth table is:</para>

<para><image>14170.png</image></para> <comment>7-segment truth table</comment>

<para>Deciding what to do with the remaining six entries of the truth table is
easier with this circuit. This circuit should not be expected to encode an
undefined combination of inputs, so we can leave them as "don't care" when we
design the circuit. The equations were simplified with karnaugh maps.</para>

<para><image>14174.png</image></para> <comment>7-segment D0 D1 k-maps</comment>

<para><image>14175.png</image></para> <comment>7-segment D2 D3 k-maps</comment>

<para><image>14176.png</image></para> <comment>7-segment D4 D5 D6 k-maps</comment>

<para>The collection of equations is summarised here:</para>

<para><image>14171.png</image></para> <comment>7-segment equations</comment>


<para>The circuit is:</para>

<tex>
 (See Figure<ref>04464.png below</ref>.)
</tex>

<htmlo>
<para><image>04464.png</image></para> <comment>7-segment circuit</comment>
</htmlo>

<comment>04474.eps was formerly a rotated version of 04464.eps</comment>

<tex>
<image>04464.png<caption>Seven-segment decoder gate level diagram.</caption></image>
</tex>

<para>And the corresponding ladder diagram:</para>

<htmlo>
<para><image>04483.png</image></para> <comment>7-segment ladder</comment>
</htmlo>

<tex>
<para><image>04489.png</image></para> <comment>7-segment ladder</comment>
</tex>
</section>

<section>

<sectiontitle>Magnitude Comparator</sectiontitle>

<index>Comparator, Magnitude</index>
<index>Equality, Digital</index>

All of the circuits we have looked at so far are considered standard circuits
that "everyone" should know, and that "everyone" should know how to combine
into larger pieces.
So up until now we've been combining 1-bit circuits into multi-bit circuits
and, at least implicitly, asking you to confirm that it works with very little
concern over how we figured out to combine them.

Let's slow down just a little and think about how you figure this out.
You may recall our discussion in the <italic>Karnaugh Mapping</italic> chapter
about a magnitude comparator and how we calculated the logic function for the
A<gt>B output and two 3-bit inputs.
Let's consider the A=B output and build it up from a 1-bit version to 4-bit version.

The truth table for a 1-bit equality function is

_image from before_

This should look very familiar to us because its the XNOR gate.

The truth table for a 2-bit equality function is

_image_

Our first option is to use a either boolean algebra or a karnaugh map to
determine the sum-of-products or products-of-sums equation and connect
our gates;
and that option worked very well for our 7-segment encoder where a 1-bit version doesn't really exist.

Our second option is to combine our 1-bit circuit into a 2-bit circuit.

First we add to our truth table to highlight our already existing 1-bit circuit.

_image_

Then we reorganize it to group our 1-bit, or intermediate, results together.
I like to treat the intermediate results as if they are a binary number and count from 0 up,
but any method that groups all of the same intermediate result together works just fine.

If you find that a pair of results where the intermediate results are the same but
the final outputs are different, then you've got to go back to making a sum-of-products
or product-of-sums circuit.
We don't have that problem here, so condense the truth table by
removing the real inputs and just looking at the intermediate results.

_image from before_

This is the AND gate.

So here's our 2-bit circuit

_image_

Now let's repeat

Initial truth table (abbreviated) is

_image_

With intermediate results (abbreviated) is

_image_

Trimmed down to just the intermediate results, but wait.
Which intermediate results?

We can either look at the results from our 1-bit equality circuit or we can look at
the results from our 2-bit equality circuit.
Without any prior knowledge, the simplest course to follow is to ignore the intermediate results from the 1-bit equality circuit,
because we already built a 2-bit equality circuit.
This will generate a smaller karnaugh map or simler logic equation to implement.
So, looking at the correct intermediate results we find

_image from above_

There it is again, our old friend the AND gate.

Our circuit looks like this

_image_

and we can correctly infer that an 8-bit equality circuit can be built like this

_image_

because the detailed version looks like this

_image_

This is one reason why binary circuits seem to come in 8, 16, and 32-bit versions but
sizes like 23-bits are rarer.

Now I'm going to disappoint you, this isn't how a 4-bit equality circuit looks like in the wild.
It usually looks more like this

_image_

This does make sense, if each pair of bits are equal then the number is equal.
So why would you go through this process instead of just logically thinking about the circuit and building it?
And how did someone figure this out?

There are a few reasons you would go through this process.

<bold>Simplicity</bold>

Remember back to algebra and being introduced to the quadratic equation?
Did you see the point at first?
Most don't because you first use the quadratic equation on functions that can quite easily be factored;
but there's a point where factoring becomes more difficult than just plugging <italic>a</italic>,
<italic>b</italic>, and <italic>c</italic> into a memorized function.

Likewise this circuit is simple, but you sometimes designing a 1-bit solution and doubling it's
capacity for something not quite as simple and approaching it this way will allow you to complete
the design quicker - and the time it takes to design a circuit does matter.

<bold>Preparing for the future</bold>

The second reason is to prepare for the future.
Imagine that you made a 1024-bit version of this circuit, and then think about the number of gates
all the signals have to run through before you have your final result.
For this circuit there's the XNOR gates, plus the 2-bit AND, the 4-bit AND, ...

If you find out that your circuit works well but just isn't <italic>fast enough</italic> you can
either go for broke and calculate the entire logic function, or you can take a step inside and
just calculate the logic function for the 2-bit version.
Replace that <italic>implementation</italic> with the built-up version as long as the
<italic>function</italic> is the same.
This will make your circuit just a little bit faster, and sometimes you just need a little;
and making your circuit incrementally faster is much simpler than just making one huge logic function
which is as fast as possible.

<index>implementation versus function</index>
<index>function versus implementation</index>

If that's not fast enough you can either generate the logic function for a 4-bit version, or
follow the same process again.
In our initial design we only looked at the intermediate results for a circuit one level lower
because that makes for the simplest logic function to generate and the smallest karnaugh map.
When desiging the 4-bit version, we (almost) didn't spend any time considering the 1-bit results.
But if you are willing to accept a larger karnaugh map or a longer logic equation, you can look at the two levels lower instead.
When desiging the 4-bit version, you can look at the 1-bit vesion and your circuit will be just a little faster.
In fact, this will probably make the final version a bit more obvious!

<bold>Comprehension</bold>

A human looking at a 4-bit equality circuit and seeing that it's two 2-bit circuits which can be
understood independently, and seeing that each of those are two 1-bit circuits which can be
understood independently has a much better chance of understanding your circuit.

Even better, <italic>you</italic> have a much better chance of understanding your circuit and can
reason about it's correctness.

Finally,

<bold>Validation</bold>

Do you already know that your circuit has to be as fast as possible.
Wonderful, how do you validate that it's working?
You need to know that you calculated your logic function correctly,
that you designed your circuit correctly,
and that you connected all your gates correctly.
There's a lot that can go wrong in that process.

When you have a circuit with a large number of inputs, manually checking each and every result is simply not possible;
so you would probably only check a random sampling of results and hope the rest are correct.
Not testing 100% of the inputs is an accepted risk for complex circuits, but 1% usually isn't;
and the closer you get to 100% the better!

But when the circuit is a complex function just figuring out if the answer is correct can take time;
and time taken validating correctness of each answer means that you are much closer to 1% than 100%.

Design your 1-bit circuit first and built it up.
Accept that it it slow.
Then design your massive (but fast) circuit.
Then you can connect the circuits to an equality circuit and check that they do give the same results.

This does take more time than just designing one fast circuit, but it does give you confidence that your design
is correct.

</section>

<section>

<sectiontitle>Demultiplexers</sectiontitle>

<index>Decoder, line</index>
<index>Demultiplexer</index>
<index>dmux</index>

All the circuits we have seen so far just perform the same function, but bigger;
sometimes by duplication and sometimes by combining the outputs in new ways.
There are also circuits which combine the outputs in ways to make a circuit do something now.

<para>One of these is a demultiplexer, sometimes abbreviated dmux, is a circuit that has one
input and more than one output. It is used when a circuit wishes to send a
signal to one of many devices. This description sounds similar to the
description given for a decoder, but a decoder is used to select among many
devices while a demultiplexer is used to send a signal among many
devices.</para>

<para>A demultiplexer is used often enough that it has its own schematic
symbol</para>

<para><image>04465.png</image></para> <comment>dmux schematic symbol</comment>

<index>1-to-2 demultiplexer</index>

<para>The truth table for a 1-to-2 demultiplexer is</para>

<para><image>14172.png</image></para> <comment>dmux truth table</comment>

<index>Line decoder</index>

<para>Using our 1-to-2 decoder as part of the circuit, we can express this
circuit easily</para>

<para><image>04466.png</image></para> <comment>dmux circuit</comment>

<para><image>04484.png</image></para> <comment>dmux ladder</comment>

<para>This circuit can be expanded two different ways. You can increase the
number of signals that get transmitted, or you can increase the number of
inputs that get passed through. To increase the number of inputs that get
passed through just requires a larger line decoder. Increasing the number of
signals that get transmitted is even easier.</para>

<para>As an example, a device that passes one set of two signals among four
signals is a "two-bit 1-to-2 demultiplexer". Its circuit is</para>

<para><image>04467.png</image></para> <comment>Expanded dmux</comment>

<para>or by expressing the circuit as</para>

<para><image>04468.png</image></para> <comment>Expanded dmux simplified circuit</comment>

<para><image>04485.png</image></para> <comment>Expanded dmux simplified ladder</comment>

<para>shows that it could be two one-bit 1-to-2 demultiplexers without changing
its expected behavior.</para>

<index>1-to-4 demultiplexer</index>

<para>A 1-to-4 demultiplexer can easily be built from 1-to-2 demultiplexers as
follows.</para>

<para><image>04469.png</image></para> <comment>2-to-4 demultiplexer</comment>

</section>

<section>

<sectiontitle>Multiplexers</sectiontitle>

<index>Multiplexer</index>
<index>mux</index>

<para>A multiplexer, abbreviated mux, is a device that has multiple inputs and
one output.</para>

<para>The schematic symbol for multiplexers is</para>

<para><image>04470.png</image></para> <comment>multiplexer schematic</comment>

<index>2-to-1 multiplexer</index>

<para>The truth table for a 2-to-1 multiplexer is</para>

<para><image>14173.png</image></para> <comment>multiplexer truth table</comment>

<index>Decoder, line</index>
<index>Line decoder</index>

<para>Using a 1-to-2 decoder as part of the circuit, we can express this circuit
easily.</para>

<para><image>04471.png</image></para> <comment>2-to-1 multiplexer circuit</comment>

<para><image>04486.png</image></para> <comment>2-to-1 multiplexer ladder</comment>

<index>4-to-1 multiplexer</index>

<para>Multiplexers can also be expanded with the same naming conventions as
demultiplexers. A 4-to-1 multiplexer circuit is</para>

<para><image>04472.png</image></para> <comment>4-to-1 multiplexer</comment>

<para>That is the formal definition of a multiplexer. Informally, there is a lot
of confusion. Both demultiplexers and multiplexers have similar names,
abbreviations, schematic symbols and circuits, so confusion is easy. The term
multiplexer, and the abbreviation mux, are often used to also mean a
demultiplexer, or a multiplexer and a demultiplexer working together. So when
you hear about a multiplexer, it may mean something quite different.</para>

</section>

<section>

<sectiontitle>Using multiple combinational circuits</sectiontitle>

Finally, there are many circuits which do such complex things that the
only reasonable recourse is to combine several disparate circuits
based on a logical design.

<para>As an example of this, we are going to make a
device that will have 16 inputs, representing a four digit number, to a four
digit 7-segment display but using just one binary-to-7-segment encoder.</para>

<para>First, the overall architecture of our circuit provides what looks like
our the description provided.</para>

<para><image>04473.png</image></para> <comment>4 digit display circuit</comment>

<para>Follow this circuit through and you can confirm that it matches the
description given above. There are 16 primary inputs. There are two more inputs
used to select which digit will be displayed. There are 28 outputs to control
the four digit 7-segment display. Only four of the primary inputs are encoded at
a time. You may have noticed a potential question though.</para>

<para>When one of the digits are selected, what do the other three digits
display? Review the circuit for the demultiplexers and notice that any line not
selected by the A input is zero. So the other three digits are blank. We don't
have a problem, only one digit displays at a time.</para>

<para>Let's get a perspective on just how complex this circuit is by looking at
the equivalent ladder logic.</para>

<para><image>04487.png</image></para>

<comment>4 digit display circuit</comment>

<para>Notice how quickly this large circuit was developed from smaller parts.
This is true of most complex circuits: they are composed of smaller parts
allowing a designer to abstract away some complexity and understand the circuit
as a whole. Sometimes a designer can even take components that others have
designed and remove the detail design work.</para>

<para>In addition to the added quantity of gates, this design suffers from one
additional weakness. You can only see one display one digit at a time. If there
was some way to rotate through the four digits quickly, you could have the
appearance of all four digits being displayed at the same time. That is a job
for a sequential circuit, which is the subject of the next several chapters.
</para>

</section>

</chapter>

<pagebreak>

