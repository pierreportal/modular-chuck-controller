import React, { useState } from 'react';
import { Text, Box, useFocus, useInput } from 'ink';
import { FocusableBox } from '../FocusableBox/index.js';

const DUMMY_DATA = [
	{
		id: 1,
		name: "title item",
		sequence: "0 1 0 0 3 0 1 0"
	},
	{
		id: 2,
		name: "super cool item",
		sequence: "5 0 0 0 1 0 4 0"
	}
];

const Item = ({ item, libraryFocused, isFocused }: any) => {
	return (
		<Box>
			<Text backgroundColor={isFocused && (!libraryFocused ? 'grey' : 'cyan')}>
				<Text bold> {item.id} |</Text>
				<Text> {item.sequence} |</Text>
				<Text wrap="wrap">{item.name}</Text>
			</Text>
		</Box>
	);
}


export const Library = () => {

	const { isFocused } = useFocus({ id: 'library', autoFocus: true });
	const [index, setIndex] = useState(0);


	useInput((_, key) => {
		if (isFocused) {
			if (key.upArrow) {
				setIndex(prev => Math.max(0, prev - 1));
			} else if (key.downArrow) {
				setIndex(prev => Math.min(prev + 1, DUMMY_DATA.length - 1));
			}
		}
	});

	return (
		<FocusableBox focusId="library" width="70%" height={process.stdout.rows - 5} flexDirection='column'>
			{DUMMY_DATA.map((item, i) => (
				<Item key={item.id} item={item} libraryFocused={isFocused} isFocused={index === i} />
			))}
		</FocusableBox>
	);
}
