<script>
	import { T } from '@threlte/core';
	import { Vector2 } from 'three';
	import { windowSizeStore, mouseStore } from 'svelte-legos';

	import fragmentShader from '$lib/fragment.glsl?raw';
	import vertexShader from '$lib/vertex.glsl?raw';

	// Time uniform
	let time = 0.0;
	function animate() {
		requestAnimationFrame(animate);

		// Update the time uniform
		time += 0.05;
	}
	animate();

	// Window size uniform
	const size = windowSizeStore();
	const sizeUniform = new Vector2();
	$: sizeUniform.set($size.width, $size.height);
	$: s = Math.max($size.width, $size.height);

	// Mouse position uniform
	const position = mouseStore();
	const positionUniform = new Vector2();
	$: positionUniform.set($position.x, $position.y);
</script>

<!-- Perspective Camera setup -->
<!-- Creates a 3D plane in the middle of the screen -->
<!-- <T.PerspectiveCamera makeDefault position={[0, 1.5, 10]} fov={15}></T.PerspectiveCamera>
<T.Mesh position={[0, 1.5, 0]} rotation={[0, 0, 0]}>
	<T.PlaneGeometry args={[2, 2, 1]} />
	<T.ShaderMaterial
		{vertexShader}
		{fragmentShader}
		uniforms={{
			uTime: { value: 0.0 }
		}}
		uniforms.uTime.value={time}
	></T.ShaderMaterial>
</T.Mesh> -->

<!-- Orthographic Camera -->
<!-- Creates a full screen shader that covers the screen -->
<T.OrthographicCamera makeDefault position={[0, 0, 1]}></T.OrthographicCamera>
<T.Mesh position={[0, 0, 0]} rotation={[0, 0, 0]}>
	<T.PlaneGeometry args={[s, s]} />
	<T.ShaderMaterial
		{vertexShader}
		{fragmentShader}
		uniforms={{
			uTime: { value: 0.0 },
			uSpeed: { value: 1.0 },
			uIntensity: { value: 1.0 },
			uMouse: { value: positionUniform },
			uResolution: { value: sizeUniform },
			uSeed: { value: Math.random() }
		}}
		uniforms.uTime.value={time}
	></T.ShaderMaterial>
</T.Mesh>
