import React, { useState } from 'react';
import { Text, useFocus, useInput } from 'ink';
import TextInput from 'ink-text-input';
import { FocusableBox } from '../FocusableBox/index.js';


export const Prompt = () => {
	const [input, setInput] = useState('');
	const { isFocused } = useFocus({ id: 'prompt' });
	const [history, setHistory] = useState<string>('');

	useInput((_, key) => {
		if (isFocused) {
			if (key.return && input.trim().length) {
				setHistory(input);
				setInput('');
			} else if (key.upArrow) {
				setInput(history);
			} else if (key.downArrow) {
				setInput('');
			}
		}
	});

	return (
		<FocusableBox focusId="prompt">
			<Text bold>{" > "}</Text>
			{
				isFocused
					? <TextInput value={input} onChange={setInput} />
					: <Text color="gray">{input}</Text>
			}
		</FocusableBox>
	);
}
