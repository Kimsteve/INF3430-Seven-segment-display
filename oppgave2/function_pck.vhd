
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
	PACKAGE function_pck is
	
	function truth_table (signal D0Dec0 : std_logic_vector (4 downto 0)) return std_logic_vector;
	end function_pck;

package body  function_pck	is 
	function truth_table (signal D0Dec0 : std_logic_vector (4 downto 0)) return std_logic_vector is
	begin
		case D0Dec0 is
		when "00000" => return  "00000011"; --0
		when "00010" =>return  "10011111"; --1
		when "00100" =>return  "00100101"; --2
		when "00110" =>return  "00001101"; --3
		when "01000" =>return  "10011001"; --4  
		when "01010" =>return  "01001001";--5
		when "01100" =>return  "01000001";--6
		when "01110" =>return  "00011111";--7
		when "10000" =>return  "00000001";--8
		when "10010" =>return "00011001";--9
		when "10100" =>return  "00010001";--A
		when "10110" =>return  "11000001";--B
		when "11000" =>return  "01100011";--C
		when "11010" =>return  "10000101";--D 
		when "11100" =>return  "01100001";--E
		when "11110" =>return  "01110001";--E
		when OTHERS =>return  "11111111";--F
		end case;  
	end function truth_table;
end function_pck;
	 
