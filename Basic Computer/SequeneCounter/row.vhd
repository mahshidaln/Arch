----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:52:59 11/01/2015 
-- Design Name: 
-- Module Name:    row - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity row is
port(a, load, loadnot, dd, clock:in std_logic; qq, qqnot, aq: out std_logic);
end row;


architecture Behavioral of row is
component Dff is
	port(D, clk:in std_logic; Q, Qnot:out std_logic);
end component;
signal qxa, lad, lnotaq:std_logic;
signal tmp, tmp2: std_logic;
begin
	qxa <= tmp xor a;
	lad <= load and dd;
	lnotaq <= loadnot and qxa;
	aq <= a and tmp;
	tmp2 <= lad or lnotaq;
	laskjdf: Dff port map(tmp2, clock, tmp, qqnot);
	qq <= tmp;
end Behavioral;

