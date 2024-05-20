import { useFocus, Box, BoxProps } from 'ink';
import React from 'react';

interface FocusableBoxProps {
	children: React.ReactNode;
	focusId: string;
}

const FOCUS_COLOR = "cyan";

export const FocusableBox = ({ focusId, children, ...boxProps }: FocusableBoxProps & BoxProps) => {

	const { isFocused } = useFocus({ id: focusId });

	return (
		<Box borderStyle="single" {...boxProps} borderColor={isFocused ? FOCUS_COLOR : "gray"} >
			{children}
		</Box>
	);
}
