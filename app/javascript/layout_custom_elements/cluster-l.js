class Cluster extends HTMLElement {
  constructor() {
    super();
    this.render = () => {
      this.i = `Cluster-${[this.justify, this.align, this.space].join('')}`;
      this.dataset.i = this.i;
      if (!document.getElementById(this.i)) {
        const styleEl = document.createElement('style');
        styleEl.id = this.i;
        styleEl.innerHTML = `
          [data-i="${this.i}"] {
            justify-content: ${this.justify};
            align-items: ${this.align};
            gap: ${this.space};
          }
        `.replace(/\s\s+/g, ' ').trim();
        document.head.appendChild(styleEl);
      }
    }
  }

  get justify() { return this.getAttribute('justify') || 'flex-start'; }
  set justify(val) { this.setAttribute('justify', val); }
  get align() { return this.getAttribute('align') || 'flex-start'; }
  set align(val) { this.setAttribute('align', val); }
  get space() { return this.getAttribute('space') || 'var(--space-l)'; }
  set space(val) { this.setAttribute('space', val); }
  static get observedAttributes() { return ['justify', 'align', 'space']; }
  connectedCallback() { this.render(); }
  attributeChangedCallback() { this.render(); }
}

customElements.define('cluster-l', Cluster);
