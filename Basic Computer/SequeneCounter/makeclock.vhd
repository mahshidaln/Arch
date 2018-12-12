----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:51:44 11/01/2015 
-- Design Name: 
-- Module Name:    makeclock - Behavioral 
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

entity makeclock is
port(clk:in std_logic; clock:out std_logic);
end makeclock;

architecture Behavioral of makeclock is
signal a:integer := 0;	
signal tmp:std_logic := '0';
begin	
	clock <= tmp;

	process(clk)
	begin
		if(rising_edge(clk))then
			a <= a + 1;
		
			if(a > 20000000)then
			---clock <= not clock;
				a <= 0;
				tmp <= not tmp;
			end if;
		end if;
	end process;

end Behavioral;

