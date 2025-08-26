class Box extends HTMLElement {
  constructor() {
    super();
    this.render = () => {
      this.i = `Box-${[this.padding, this.borderWidth, this.invert].join('')}`;
      this.dataset.i = this.i;
      if (!document.getElementById(this.i)) {
        const styleEl = document.createElement('style');
        styleEl.id = this.i;
        styleEl.innerHTML = `
          [data-i="${this.i}"] {
            padding: ${this.padding};
            border: ${this.borderWidth} solid;
            ${this.invert ?
            `background-color: var(--color-light);
              filter: invert(100%);`
            : ''}
          }
          [data-i="${this.i}"] {
            background-color: inherit;
          }
        `.replace(/\s\s+/g, ' ').trim();
        document.head.appendChild(styleEl);
      }
    }
  }

  get padding() { return this.getAttribute('padding') || 'var(--space-l)'; }
  set padding(val) { this.setAttribute('padding', val); }
  get borderWidth() { return this.getAttribute('borderWidth') || 'var(--border-thin)'; }
  set borderWidth(val) { this.setAttribute('borderWidth', val); }
  get invert() { return this.hasAttribute('invert'); }
  set invert(val) { val ? this.setAttribute('invert', '') : this.removeAttribute('invert'); }
  static get observedAttributes() { return ['borderWidth', 'padding', 'invert']; }
  connectedCallback() { this.render(); }
  attributeChangedCallback() { this.render(); }
}

customElements.define('box-l', Box);
