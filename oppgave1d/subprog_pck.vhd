----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


PACKAGE subprog_pck is
	function parity (signal indata1 : in std_logic_vector (15 downto 0)) return std_logic;
	function parity (signal indata2 : in  unsigned(15 downto 0)) return std_logic;
	 
end subprog_pck;

PACKAGE BODY subprog_pck IS
		--variable parity1, parity2 : std_logic; 
	function parity (signal indata1 : in std_logic_vector (15 downto 0)   ) return std_logic is
	 variable p1, p2, p3 : std_logic;
	   begin
		p1 := '0';
		for i in indata1'range loop
                    if indata1(i) = '1' then
                       p1 := not p1;
                    end if;        
              end loop;
		return p1;
	end function parity;

    	function parity ( signal indata2 : in  unsigned(15 downto 0)   ) return std_logic is
	 variable p1, p2, p3 : std_logic;
	  begin
		 p2 := '0';
      	    for j in indata2'range loop
                 p2 := p2 xor indata2(j); 
            end loop;
		-- p3 := p1 xor p2;
	    return p2;
	 end function parity;
END subprog_pck;