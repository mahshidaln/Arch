----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:57:12 10/25/2015 
-- Design Name: 
-- Module Name:    alumain - Behavioral 
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

entity alumain is
	port(com : in std_logic_vector(2 downto 0); a, b : in std_logic_vector(3 downto 0);
		output: out std_logic_vector(7 downto 0));
end alumain;

architecture Behavioral of alumain is
component mainp is
	port(a , b: in std_logic_vector(3 downto 0); cin1: in std_logic;
	cout: out std_logic; sum: out std_logic_vector(3 downto 0));
end component;
component main is
	port(x,y: in std_logic_vector(3 downto 0); 
	p:out std_logic_vector(7 downto 0));
end component;
signal ors,qqqqq, ands, xors, nots, muls, adds, subs: 
std_logic_vector(7 downto 0) := "00000000";
signal subcom, subcarry:std_logic;
begin
	for_gen: for i in 0 to 3 generate
		ors(i) <= a(i) or b(i);
		ands(i) <= a(i) and b(i);
		xors(i) <= a(i) xor b(i);
		nots(i) <= not a(i);
	end generate;
	subcom <= '1';
	mulmmmm: main  port map(a,b,muls);
	sumssss: mainp port map(a,b,'0',adds(4),adds(3 downto 0));
	subssss: mainp port map(a,b,subcom, subcarry,subs(3 downto 0));
	with com select 
		output <= ors when "000",
					 ands when "001",
					 xors when "010",
					 nots when "011",
					 muls when "100",
					 adds when "110",
					 subs when "101",
					qqqqq when others;
					 
	
					 
	

end Behavioral;

