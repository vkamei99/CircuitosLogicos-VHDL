library ieee;
use ieee.std_logic_1164.ALL;

entity prog_prior_encoder is
    Port ( r : in  std_logic_vector (7 downto 0);
           c : in  std_logic_vector (2 downto 0);
           code : out  std_logic_vector (2 downto 0);
           active : out  std_logic);
end prog_prior_encoder;

architecture behavioral of prog_prior_encoder is
   signal mask, lower_r, upper_r : std_logic_vector (7 downto 0);
   signal lower_code, upper_code: std_logic_vector (2 downto 0);
   signal lower_active : std_logic;        
begin
    with c select
        mask <= "00000001" when "000",
                "00000011" when "001",
                "00000111" when "010",
                "00001111" when "011",
                "00011111" when "100",
                "00111111" when "101",
                "01111111" when "110",
                "11111111" when others;
               
    lower_r <= mask and r;
    upper_r <= not(mask) and r;
    
    process(upper_r)
        begin
            if upper_r(7)='1' then 
                upper_code <= "111";
            elsif upper_r(6)='1' then 
                upper_code <= "110";
            elsif upper_r(5)='1' then 
                upper_code <= "101";
            elsif upper_r(4)='1' then 
                upper_code <= "100";
            elsif upper_r(3)='1' then 
                upper_code <= "011";
            elsif upper_r(2)='1' then 
                upper_code <= "010";
            elsif upper_r(1)='1' then 
                upper_code <= "001";
            else
                upper_code <= "000";
            end if;
    end process;
    
    
    process(lower_r)
            begin
                if lower_r(7)='1' then 
                    lower_code <= "111";
                elsif lower_r(6)='1' then 
                    lower_code <= "110";
                elsif lower_r(5)='1' then 
                    lower_code <= "101";
                elsif lower_r(4)='1' then 
                    lower_code <= "100";
                elsif lower_r(3)='1' then 
                    lower_code <= "011";
                elsif lower_r(2)='1' then 
                    lower_code <= "010";
                elsif lower_r(1)='1' then 
                    lower_code <= "001";
                else
                    lower_code <= "000";
                end if;
        end process;
                
    lower_active <= lower_r(7) or lower_r(6) or lower_r(5) or lower_r(4) or lower_r(3) or lower_r(2) or lower_r(1) or lower_r(0);
    
    active <= r(7) or r(6) or r(5) or r(4) or r(3) or r(2) or r(1) or r(0);
    
    code <= lower_code when lower_active = '1' else upper_code;
				
end behavioral;