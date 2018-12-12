----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:45:16 11/01/2015 
-- Design Name: 
-- Module Name:    Dff - Behavioral 
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

entity Dff is
port(D, clk:in std_logic; Q, Qnot:out std_logic);
end Dff;

architecture Behavioral of Dff is

begin

	process(clk)
	begin
		if(rising_edge(clk))then
			Q <= D;
			Qnot <= not D;
		end if;
	end process;
end Behavioral;

