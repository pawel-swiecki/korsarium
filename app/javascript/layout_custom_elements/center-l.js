class Center extends HTMLElement {
  constructor() {
    super();
    this.render = () => {
      this.i = `Center-${[this.max, this.andText, this.gutters, this.intrinsic].join('')}`;
      this.dataset.i = this.i;
      if (!document.getElementById(this.i)) {
        const styleEl = document.createElement('style');
        styleEl.id = this.i;
        styleEl.innerHTML = `
          [data-i="${this.i}"] {
            max-inline-size: ${this.max};
            ${this.gutters ? `
            padding-inline-start: ${this.gutters};
            padding-inline-end: ${this.gutters};`
            : ''}
            ${this.andText ? `text-align: center;` : ''}
            ${this.intrinsic ? `
            display: flex;
            flex-direction: column;
            align-items: center;`
            : ''}
          }
        `.replace(/\s\s+/g, ' ').trim();
        document.head.appendChild(styleEl);
      }
    }
  }

  get max() { return this.getAttribute('max') || 'var(--measure)'; }
  set max(val) { this.setAttribute('max', val); }
  get andText() { return this.hasAttribute('andText'); }
  set andText(val) { val ? this.setAttribute('andText', '') : this.removeAttribute('andText'); }
  get gutters() { return this.getAttribute('gutters') || null; }
  set gutters(val) { this.setAttribute('gutters', val); }
  get intrinsic() { return this.hasAttribute('intrinsic'); }
  set intrinsic(val) { val ? this.setAttribute('intrinsic', '') : this.removeAttribute('intrinsic'); }
  static get observedAttributes() { return ['max', 'andText', 'gutters', 'intrinsic']; }
  connectedCallback() { this.render(); }
  attributeChangedCallback() { this.render(); }
}

customElements.define('center-l', Center);
