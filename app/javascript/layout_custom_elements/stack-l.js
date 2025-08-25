class Stack extends HTMLElement {
  constructor() {
    super();
    this.render = () => {
      this.i = `Stack-${[this.space, this.recursive, this.splitAfter].join('')}`;
      this.dataset.i = this.i;
      if (!document.getElementById(this.i)) {
        const styleEl = document.createElement('style');
        styleEl.id = this.i;
        styleEl.innerHTML = `
          [data-i="${this.i}"]${this.recursive ? '' : ' >'} * + * {
            margin-block-start: ${this.space};
          }
          ${this.splitAfter ? `
            [data-i="${this.i}"]:only-child {
              block-size: 100%;
            }
            [data-i="${this.i}"] > :nth-child(${this.splitAfter}) {
              margin-block-end: auto;
            }`
          : ''}
        `.replace(/\s\s+/g, ' ').trim();
        document.head.appendChild(styleEl);
      }
    }
  }

  get space() { return this.getAttribute('space') || 'var(--space-l)'; }
  set space(val) { this.setAttribute('space', val); }
  get recursive() { return this.hasAttribute('recursive'); }
  set recursive(val) { val ? this.setAttribute('recursive', '') : this.removeAttribute('recursive'); }
  get splitAfter() { return this.getAttribute('splitAfter') || null; }
  set splitAfter(val) { this.setAttribute('splitAfter', val); }
  static get observedAttributes() { return ['space', 'recursive', 'splitAfter']; }
  connectedCallback() { this.render(); }
  attributeChangedCallback() { this.render(); }
}

customElements.define('stack-l', Stack);
