# vending-machine-processor

Basic 8-bit vending maching processor design which offers support for two drinks and currency of 5 cent, 10 cent, 25 cent denominations.

As an engineer working in a high tech company, asked to implement a RTL description of a vending machine processor using VHDL to control a vending machine. 
Figure 1 shows the block diagram of the vending machine.

Here is how the vending machine is supposed to work: 
The machine has a single coin slot that accepts nickels, dimes and quarters, one at a time. A coin sensor provides the processor with a 1-bit input C that becomes 1 when a coin is detected, and an 8-bit input V indicating the coin's value in cents. Two 8-bit inputs SO and S1 indicate the cost of the two types of soda drink. Note that the value of SO and S1 can be set by the vending machine owner. Choice is a 1-bit input to the vending machine indicating the type of soda drink selected (Choice 0 is for soda drink type 0 with the cost S0 and Choice 1 is for soda drink type 1 with cost of S1).

If the amount of money deposited is less than the cost of the soda, the processor generates an 8-bit output P to display the amount of money deposited in cents. Once the processor has seen coins whose value equals or exceeds the cost of a soda, the processor should set an 2-bit output D for one clock cycle, causing a soda to be dispensed (00 or 11 for no action, 01 for the release of soft drink type 0, and 10 for the
release of soft drink type 1).

The vending machine also should generate the 8-bit output E indicating the change to be returned in cents. 