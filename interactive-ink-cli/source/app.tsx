import React from 'react';
import { Box } from 'ink';
import { Library } from './components/Library/index.js';
import { _useFocusManager } from './hooks/focusManager.js';
import { Prompt } from './components/Prompt/index.js';


export default function App() {

	_useFocusManager();
	return (
		<Box flexDirection="column">
			<Library />
			<Prompt />
		</Box>
	);
}
