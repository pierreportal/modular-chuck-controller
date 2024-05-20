import { useFocus, useFocusManager, useInput } from 'ink';

export const _useFocusManager = () => {

	const { focus } = useFocusManager();

	const { isFocused: promptActive } = useFocus({ id: 'prompt' });

	useInput((input, key) => {
		if (!promptActive) {
			if (input === ':') {
				focus('prompt');
			} else if (input === 'l') {
				focus('library');
			}
		}
		if (key.escape) {
			focus('library');
		}
	});
};
