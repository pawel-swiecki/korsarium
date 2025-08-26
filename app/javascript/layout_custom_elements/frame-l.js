class Frame extends HTMLElement {
  constructor() {
    super();
    this.render = () => {
      if (this.children.length !== 1) {
        console.warn('<frame-l> elements should have just one child element');
      }
      this.i = `Frame-${[this.ratio].join('')}`;
      this.dataset.i = this.i;
      if (!document.getElementById(this.i)) {
        const ratio = this.ratio.split(':');
        const styleEl = document.createElement('style');
        styleEl.id = this.i;
        styleEl.innerHTML = `
          [data-i="${this.i}"] {
            aspect-ratio: ${ratio[0]} / ${ratio[1]};
          }
        `.replace(/\s\s+/g, ' ').trim();
        document.head.appendChild(styleEl);
      }
    }
  }

  get ratio() { return this.getAttribute('ratio') || '16:9'; }
  set ratio(val) { this.setAttribute('ratio', val); }
  static get observedAttributes() { return ['ratio']; }
  connectedCallback() { this.render(); }
  attributeChangedCallback() { this.render(); }
}

customElements.define('frame-l', Frame);
