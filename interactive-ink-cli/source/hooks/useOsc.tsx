import { Server } from 'node-osc';
import { useEffect } from 'react';

const oscServer = new Server(3333, '0.0.0.0', () => {
	console.log('OSC Server is listening');
});

export const useOsc = () => {

	useEffect(() => {
		oscServer.on('bundle', function (bundle) {
			bundle.elements.forEach((element, i) => {
				console.log(`Message ${i}: ${element}`);
			});
		});
		return () => {
			oscServer.close();
		};
	}, []);
}
