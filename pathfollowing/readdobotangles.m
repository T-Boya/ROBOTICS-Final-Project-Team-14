function ang = readdobotangles(arduinoObj)

    flush(arduinoObj);
    line_str = readline(arduinoObj); % MATLAB returns readline as string
    line_str = readline(arduinoObj); % MATLAB returns readline as string
    line_chr = convertStringsToChars(line_str); % convert the string to char array
    % line_hex = dec2hex(line_chr) % Just to see the data as byte values in hex
    %Some assertions to make sure the data is valid
    %line_chr(1)
    %char(hex2dec('A5'))
    assert(line_chr(1) == char(hex2dec('A5'))); % Assertion for header byte
    length(line_chr);
    assert(length(line_chr) == 41); % Assertion for data length is correct (ie 42 bytes, 1 is removed with end byte while reading the line)
    %See the float values in the data package
    line_float = typecast(uint8(line_chr(2:end)), 'single'); % obtain the 10 float(single) values in the data package
    %PARSING
    %Now parse the data as described in 2.1.2 DOBOT CONTROLLER RETURN DATA PACKET format
    robot.position.x = line_float(1); % X coordinate
    robot.position.y = line_float(2); % Y coordinate
    robot.position.z = line_float(3); % Z coordinate

    robot.angles.rHead = line_float(4); % Rotation value (Relative rotation angle of the end effector to the base)
    robot.angles.baseAngle = line_float(5); % Base Angle 
    robot.angles.longArmAngle = line_float(6); % Rear Arm Angle 
    robot.angles.shortArmAngle = line_float(7); % Fore Arm Angle
    robot.angles.pawArmAngle = line_float(8); % Servo Angle (joint 4 angle)

    robot.isGrab = line_float(9) > 0; % Pump State
    robot.angles.gripperAngle = line_float(10); % Gripper Angle 

    ang = robot.angles;
end