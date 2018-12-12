----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:01:53 11/01/2015 
-- Design Name: 
-- Module Name:    main - Behavioral 
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

entity maincounter is
	port(count, mainload, clok: in std_logic;dds:in std_logic_vector(7 downto 0);qs:out std_logic_vector(7 downto 0); carryout:out std_logic; clkout:out std_logic);
end maincounter;

architecture Behavioral of maincounter is
component row is
	port(a, load, loadnot, dd, clock:in std_logic; qq, qqnot, aq: out std_logic);
end component;
component makeclock is
	port(clk:in std_logic; clock:out std_logic);
end component;
signal as, aqs, tmp : std_logic_vector(8 downto 0); 
signal tmpport:std_logic;
signal clk: std_logic;
begin
	lsakj:makeclock port map(clok, clk);
	clkout <= clk;
	as(0) <= (not mainload) and count;
	tmpport <= not mainload;
	for_gen:for i in 0 to 7 generate
		alskjd:row port map(as(i), mainload, tmpport, dds(i), clk, qs(i), tmp(i), as(i+1));
	end generate;
	carryout <= as(8);
end Behavioral;

