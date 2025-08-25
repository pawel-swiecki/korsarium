class Cover extends HTMLElement {
  constructor() {
    super();
    this.render = () => {
      this.i = `Cover-${[this.centered, this.space, this.minHeight, this.noPad].join('')}`;
      this.dataset.i = this.i;
      if (!document.getElementById(this.i)) {
        const styleEl = document.createElement('style');
        styleEl.id = this.i;
        styleEl.innerHTML = `
          [data-i="${this.i}"] {
            min-height: ${this.minHeight};
            padding: ${!this.noPad ? this.space : '0'};
          }
          [data-i="${this.i}"] > * {
            margin-block: ${this.space};
          }
          [data-i="${this.i}"] > :first-child:not(${this.centered}) {
            margin-block-start: 0;
          }
          [data-i="${this.i}"] > :last-child:not(${this.centered}) {
            margin-block-end: 0;
          }
          [data-i="${this.i}"] > ${this.centered} {
            margin-block: auto;
          }
        `.replace(/\s\s+/g, ' ').trim();
        document.head.appendChild(styleEl);
      }
    }
  }

  get centered() { return this.getAttribute('centered') || 'h1'; }
  set centered(val) { this.setAttribute('centered', val); }
  get space() { return this.getAttribute('space') || 'var(--space-l)'; }
  set space(val) { this.setAttribute('space', val); }
  get minHeight() { return this.getAttribute('minHeight') || '100vh'; }
  set minHeight(val) { this.setAttribute('minHeight', val); }
  get noPad() { return this.hasAttribute('noPad'); }
  set noPad(val) { val ? this.setAttribute('noPad', '') : this.removeAttribute('noPad'); }
  static get observedAttributes() { return ['centered', 'space', 'minHeight', 'noPad']; }
  connectedCallback() { this.render(); }
  attributeChangedCallback() { this.render(); }
}

customElements.define('cover-l', Cover);
