const script = document.querySelector('script[type="importmap"]');
if (script) {
  const { imports } = JSON.parse(script.textContent);
  const layoutModules = Object.keys(imports).filter(
    key => key.startsWith('layout_custom_elements/') && key !== 'layout_custom_elements/index'
  );
 
  layoutModules.forEach(key => {
    import(key)
      .then(() => console.log(`Loaded: ${key}`))
      .catch(err => console.error(`Failed to load ${key}:`, err));
  });
}
