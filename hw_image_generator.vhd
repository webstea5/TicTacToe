LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY hw_image_generator IS
GENERIC(
	pixels_y : INTEGER := 600;    --row that box8 will appear
	pixels_x : INTEGER := 340; --column that box8 will stop
	pixels_a :  INTEGER := 660; --row that box7 will appear
	pixels_c :  INTEGER := 1260; --column that box7 will appear
	pixels_d :  INTEGER := 1320; --row that box6 will appear
	pixels_f :  INTEGER := 370;    --column that box5 will appear
	pixels_g :  INTEGER := 710;    --column that box5 will stop
	pixels_h :  INTEGER := 740);   --column that box3 will appear
PORT(
	disp_ena : IN STD_LOGIC; --display enable ('1' = display time, '0' = blanking time)
	row : IN INTEGER; --row pixel coordinate
	column : IN INTEGER; --column pixel coordinate
	p1 : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
	p2 : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
	red : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --red magnitude output to DAC
	green : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');  --green magnitude output to DAC
	blue : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0')); --blue magnitude output to DAC
END hw_image_generator;

ARCHITECTURE behavior OF hw_image_generator IS
	BEGIN
	PROCESS(disp_ena, row, column, p1, p2)
		BEGIN

		IF(disp_ena = '1') THEN --display time
			IF(row < pixels_y AND column < pixels_x) THEN --box0
				red <= (OTHERS => '0');
				green <= (OTHERS => '0');
				blue <= (OTHERS => '0');
				IF(p1(0) = '1') THEN
					red <= (OTHERS => '1');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '0');
				ELSIF(p2(0) = '1') THEN
					red <= (OTHERS => '0');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '1');
				END IF;
			ELSIF(row > pixels_a AND  row < pixels_c AND column < pixels_x) THEN --box1
				red <= (OTHERS => '0');
				green <= (OTHERS => '0');
				blue <= (OTHERS => '0');
				IF(p1(1) = '1') THEN
					red <= (OTHERS => '1');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '0');
				ELSIF(p2(1) = '1') THEN
					red <= (OTHERS => '0');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '1');
				END IF;
			ELSIF(row > pixels_d AND column < pixels_x) THEN --box2
				red <= (OTHERS => '0');
				green <= (OTHERS => '0');
				blue <= (OTHERS => '0');
				IF(p1(2) = '1') THEN
					red <= (OTHERS => '1');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '0');
				ELSIF(p2(2) = '1') THEN
					red <= (OTHERS => '0');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '1');
				END IF;
			ELSIF(row < pixels_y AND column > pixels_f AND column < pixels_g) THEN --box3
				red <= (OTHERS => '0');
				green <= (OTHERS => '0');
				blue <= (OTHERS => '0');
				IF(p1(3) = '1') THEN
					red <= (OTHERS => '1');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '0');
				ELSIF(p2(3) = '1') THEN
					red <= (OTHERS => '0');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '1');
				END IF;
			ELSIF(row > pixels_a AND  row < pixels_c AND column < pixels_g AND column > pixels_f) THEN --box4
				red <= (OTHERS => '0');
				green <= (OTHERS => '0');
				blue <= (OTHERS => '0');
				IF(p1(4) = '1') THEN
					red <= (OTHERS => '1');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '0');
				ELSIF(p2(4) = '1') THEN
					red <= (OTHERS => '0');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '1');
				END IF;
			ELSIF(row > pixels_d AND column < pixels_g AND column > pixels_f) THEN --box5
				red <= (OTHERS => '0');
				green <= (OTHERS => '0');
				blue <= (OTHERS => '0');
				IF(p1(5) = '1') THEN
					red <= (OTHERS => '1');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '0');
				ELSIF(p2(5) = '1') THEN
					red <= (OTHERS => '0');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '1');
				END IF;
			ELSIF(row < pixels_y AND column > pixels_h) THEN --box6
				red <= (OTHERS => '0');
				green <= (OTHERS => '0');
				blue <= (OTHERS => '0');
				IF(p1(6) = '1') THEN
					red <= (OTHERS => '1');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '0');
				ELSIF(p2(6) = '1') THEN
					red <= (OTHERS => '0');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '1');
				END IF;
			ELSIF(row > pixels_a AND  row < pixels_c AND column > pixels_h) THEN --box7
				red <= (OTHERS => '0');
				green <= (OTHERS => '0');
				blue <= (OTHERS => '0');
				IF(p1(7) = '1') THEN
					red <= (OTHERS => '1');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '0');
				ELSIF(p2(7) = '1') THEN
					red <= (OTHERS => '0');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '1');
				END IF;
			ELSIF(row > pixels_d AND column > pixels_h) THEN --box8
				red <= (OTHERS => '0');
				green <= (OTHERS => '0');
				blue <= (OTHERS => '0');
				IF(p1(8) = '1') THEN
					red <= (OTHERS => '1');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '0');
				ELSIF(p2(8) = '1') THEN
					red <= (OTHERS => '0');
					green <= (OTHERS => '0');
					blue <= (OTHERS => '1');
				END IF;
			ELSE
				red <= (OTHERS => '1');
				green <= (OTHERS => '1');
				blue <= (OTHERS => '1');
				IF((p1(0)='1' AND p1(1)='1' AND p1(2)='1') OR
					(p1(3)='1' AND p1(4)='1' AND p1(5)='1') OR
					(p1(6)='1' AND p1(7)='1' AND p1(8)='1') OR
					(p1(0)='1' AND p1(3)='1' AND p1(6)='1') OR
					(p1(1)='1' AND p1(4)='1' AND p1(7)='1') OR
					(p1(2)='1' AND p1(5)='1' AND p1(8)='1') OR
					(p1(0)='1' AND p1(4)='1' AND p1(8)='1') OR
					(p1(2)='1' AND p1(4)='1' AND p1(6)='1')) THEN
						red <= (OTHERS => '1');
						green <= (OTHERS => '0');
						blue <= (OTHERS => '0');
				ELSIF((p2(0)='1' AND p2(1)='1' AND p2(2)='1') OR
					(p2(3)='1' AND p2(4)='1' AND p2(5)='1') OR
					(p2(6)='1' AND p2(7)='1' AND p2(8)='1') OR
					(p2(0)='1' AND p2(3)='1' AND p2(6)='1') OR
					(p2(1)='1' AND p2(4)='1' AND p2(7)='1') OR
					(p2(2)='1' AND p2(5)='1' AND p2(8)='1') OR
					(p2(0)='1' AND p2(4)='1' AND p2(8)='1') OR
					(p2(2)='1' AND p2(4)='1' AND p2(6)='1')) THEN
						red <= (OTHERS => '0');
						green <= (OTHERS => '0');
						blue <= (OTHERS => '1');
				ELSIF((p1(0)='1' AND p1(1)='1' AND p2(2)='1' AND
					p2(3)='1' AND p2(4)='1' AND p1(5)='1' AND
					p1(6)='1' AND p1(7)='1' AND p2(8)='1') OR
					
					(p2(0)='1' AND p2(1)='1' AND p1(2)='1' AND
					p1(3)='1' AND p1(4)='1' AND p2(5)='1' AND
					p2(6)='1' AND p2(7)='1' AND p1(8)='1') OR 
					
					(p1(0)='1' AND p2(1)='1' AND p1(2)='1' AND
					p2(3)='1' AND p1(4)='1' AND p2(5)='1' AND
					p2(6)='1' AND p1(7)='1' AND p2(8)='1') OR
					
					(p2(0)='1' AND p1(1)='1' AND p2(2)='1' AND
					p1(3)='1' AND p2(4)='1' AND p1(5)='1' AND
					p1(6)='1' AND p2(7)='1' AND p1(8)='1') OR
					
					(p1(0)='1' AND p2(1)='1' AND p2(2)='1' AND
					p2(3)='1' AND p1(4)='1' AND p1(5)='1' AND
					p1(6)='1' AND p2(7)='1' AND p2(8)='1') OR
					
					(p2(0)='1' AND p1(1)='1' AND p1(2)='1' AND
					p1(3)='1' AND p2(4)='1' AND p2(5)='1' AND
					p2(6)='1' AND p1(7)='1' AND p1(8)='1') OR
					
					(p1(0)='1' AND p2(1)='1' AND p1(2)='1' AND
					p1(3)='1' AND p2(4)='1' AND p1(5)='1' AND
					p2(6)='1' AND p1(7)='1' AND p2(8)='1') OR
					
					(p2(0)='1' AND p1(1)='1' AND p2(2)='1' AND
					p2(3)='1' AND p1(4)='1' AND p2(5)='1' AND
					p1(6)='1' AND p2(7)='1' AND p1(8)='1') OR
					
					(p1(0)='1' AND p2(1)='1' AND p1(2)='1' AND
					p1(3)='1' AND p2(4)='1' AND p2(5)='1' AND
					p2(6)='1' AND p1(7)='1' AND p1(8)='1') OR
					
					(p2(0)='1' AND p1(1)='1' AND p2(2)='1' AND
					p2(3)='1' AND p1(4)='1' AND p1(5)='1' AND
					p1(6)='1' AND p2(7)='1' AND p2(8)='1') OR
					
					(p1(0)='1' AND p2(1)='1' AND p1(2)='1' AND
					p2(3)='1' AND p2(4)='1' AND p1(5)='1' AND
					p1(6)='1' AND p1(7)='1' AND p2(8)='1') OR
					
					(p2(0)='1' AND p1(1)='1' AND p2(2)='1' AND
					p1(3)='1' AND p1(4)='1' AND p2(5)='1' AND
					p2(6)='1' AND p2(7)='1' AND p1(8)='1') OR
					
					(p1(0)='1' AND p1(1)='1' AND p2(2)='1' AND
					p2(3)='1' AND p2(4)='1' AND p1(5)='1' AND
					p1(6)='1' AND p2(7)='1' AND p1(8)='1') OR
					
					(p2(0)='1' AND p2(1)='1' AND p1(2)='1' AND
					p1(3)='1' AND p1(4)='1' AND p2(5)='1' AND
					p2(6)='1' AND p1(7)='1' AND p2(8)='1') OR
					
					(p2(0)='1' AND p1(1)='1' AND p1(2)='1' AND
					p1(3)='1' AND p2(4)='1' AND p2(5)='1' AND
					p1(6)='1' AND p2(7)='1' AND p1(8)='1') OR
					
					(p1(0)='1' AND p2(1)='1' AND p2(2)='1' AND
					p2(3)='1' AND p1(4)='1' AND p1(5)='1' AND
					p2(6)='1' AND p1(7)='1' AND p2(8)='1') OR
					
					(p1(0)='1' AND p1(1)='1' AND p2(2)='1' AND
					p2(3)='1' AND p1(4)='1' AND p1(5)='1' AND
					p1(6)='1' AND p2(7)='1' AND p2(8)='1') OR
					
					(p2(0)='1' AND p2(1)='1' AND p1(2)='1' AND
					p1(3)='1' AND p2(4)='1' AND p2(5)='1' AND
					p2(6)='1' AND p1(7)='1' AND p1(8)='1') OR
					
					(p2(0)='1' AND p1(1)='1' AND p2(2)='1' AND
					p1(3)='1' AND p1(4)='1' AND p2(5)='1' AND
					p1(6)='1' AND p2(7)='1' AND p1(8)='1') OR
					
					(p1(0)='1' AND p2(1)='1' AND p1(2)='1' AND
					p2(3)='1' AND p2(4)='1' AND p1(5)='1' AND
					p2(6)='1' AND p1(7)='1' AND p2(8)='1') OR
					
					(p2(0)='1' AND p2(1)='1' AND p1(2)='1' AND
					p1(3)='1' AND p1(4)='1' AND p2(5)='1' AND
					p2(6)='1' AND p1(7)='1' AND p1(8)='1') OR
					
					(p1(0)='1' AND p1(1)='1' AND p2(2)='1' AND
					p2(3)='1' AND p2(4)='1' AND p1(5)='1' AND
					p1(6)='1' AND p2(7)='1' AND p2(8)='1') OR
					
					(p1(0)='1' AND p2(1)='1' AND p1(2)='1' AND
					p2(3)='1' AND p1(4)='1' AND p1(5)='1' AND
					p2(6)='1' AND p1(7)='1' AND p2(8)='1') OR
					
					(p2(0)='1' AND p2(1)='1' AND p1(2)='1' AND
					p1(3)='1' AND p2(4)='1' AND p2(5)='1' AND
					p2(6)='1' AND p1(7)='1' AND p1(8)='1') OR
					
					(p2(0)='1' AND p1(1)='1' AND p2(2)='1' AND
					p1(3)='1' AND p2(4)='1' AND p2(5)='1' AND
					p1(6)='1' AND p2(7)='1' AND p1(8)='1') OR
					
					(p1(0)='1' AND p2(1)='1' AND p1(2)='1' AND
					p2(3)='1' AND p1(4)='1' AND p1(5)='1' AND
					p2(6)='1' AND p1(7)='1' AND p2(8)='1') OR
					
					(p2(0)='1' AND p2(1)='1' AND p1(2)='1' AND
					p1(3)='1' AND p2(4)='1' AND p2(5)='1' AND
					p2(6)='1' AND p1(7)='1' AND p1(8)='1') OR
					
					(p1(0)='1' AND p1(1)='1' AND p2(2)='1' AND
					p2(3)='1' AND p1(4)='1' AND p1(5)='1' AND
					p1(6)='1' AND p2(7)='1' AND p2(8)='1') OR
					
					(p1(0)='1' AND p2(1)='1' AND p1(2)='1' AND
					p2(3)='1' AND p2(4)='1' AND p1(5)='1' AND
					p2(6)='1' AND p1(7)='1' AND p2(8)='1') OR
					
					(p2(0)='1' AND p1(1)='1' AND p2(2)='1' AND
					p1(3)='1' AND p1(4)='1' AND p2(5)='1' AND
					p1(6)='1' AND p2(7)='1' AND p1(8)='1') OR
					
					(p1(0)='1' AND p1(1)='1' AND p1(2)='1' AND
					p2(3)='1' AND p2(4)='1' AND p1(5)='1' AND
					p1(6)='1' AND p2(7)='1' AND p2(8)='1') OR
					
					(p2(0)='1' AND p2(1)='1' AND p1(2)='1' AND
					p1(3)='1' AND p1(4)='1' AND p2(5)='1' AND
					p2(6)='1' AND p1(7)='1' AND p1(8)='1')) THEN
						
						red <= (OTHERS => '1');
						green <= (OTHERS => '0');
						blue <= (OTHERS => '1');
				END IF;
			END IF;
			ELSE --blanking time
				red <= (OTHERS => '0');
				green <= (OTHERS => '0');
				blue <= (OTHERS => '0');
			END IF;

		END PROCESS;
END behavior;