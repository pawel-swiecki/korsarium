class Imposter extends HTMLElement {
  constructor() {
    super();
    this.render = () => {
      this.i = `Imposter-${[this.breakout, this.fixed, this.margin].join('')}`;
      this.dataset.i = this.i;
      const margin = this.margin === '0' ? '0px' : this.margin;
      if (!document.getElementById(this.i) && (!this.breakout || this.fixed)) {
        const styleEl = document.createElement('style');
        styleEl.id = this.i;
        styleEl.innerHTML = `
          [data-i="${this.i}"] {
            ${!this.breakout ? `
              max-inline-size: calc(100% - (${margin} * 2));
              max-block-size: calc(100% - (${margin} * 2));
              overflow: auto;`
            : ''}
            ${this.fixed ? `
              position: fixed;`
            : ''}
          }
        `.replace(/\s\s+/g, ' ').trim();
        document.head.appendChild(styleEl);
      }
    }
  }

  get breakout() { return this.hasAttribute('breakout'); }
  set breakout(val) { val ? this.setAttribute('breakout', '') : this.removeAttribute('breakout'); }
  get fixed() { return this.hasAttribute('fixed'); }
  set fixed(val) { val ? this.setAttribute('fixed', '') : this.removeAttribute('fixed'); }
  get margin() { return this.getAttribute('margin') || '0px'; }
  set margin(val) { this.setAttribute('margin', val); }
  static get observedAttributes() { return ['breakout', 'margin', 'fixed']; }
  connectedCallback() { this.render(); }
  attributeChangedCallback() { this.render(); }
}

customElements.define('imposter-l', Imposter);
