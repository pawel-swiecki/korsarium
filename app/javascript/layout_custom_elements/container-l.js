class Container extends HTMLElement {
  constructor() {
    super();
    this.render = () => {
      this.i = `Container-${[this.name]}`;
      this.dataset.i = this.i;
      if (!document.getElementById(this.i)) {
        const styleEl = document.createElement('style');
        styleEl.id = this.i;
        styleEl.innerHTML = `
            [data-i="${this.i}"] {
              display: block;
              container-type: inline-size;
              ${this.name ? `container-name: ${this.name};` : ''}
            }
          `.replace(/\s\s+/g, ' ').trim();
        document.head.appendChild(styleEl);
      }
    }
  }

  get name() { return this.getAttribute('name') || null; }
  set name(val) { this.setAttribute('name', val); }
  static get observedAttributes() { return ['name']; }
  connectedCallback() { this.render(); }
  attributeChangedCallback() { this.render(); }
}

customElements.define('container-l', Container);
