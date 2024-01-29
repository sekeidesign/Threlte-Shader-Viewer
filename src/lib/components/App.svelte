<script>
	import { Canvas } from '@threlte/core';
	import Scene from './Scene.svelte';
	import { Pane } from 'svelte-tweakpane-ui';

	let rotation = [0, 0, 0];
</script>

<Pane></Pane>
<Canvas>
	<Scene {rotation} />
</Canvas>
