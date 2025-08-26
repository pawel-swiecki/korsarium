class Sidebar extends HTMLElement {
  constructor() {
    super();
    this.render = () => {
      if (!this.contentMin.includes('%')) {
        console.warn('The value for each <sidebar-l> `contentMin` property should be a percentage.');
      }
      this.i = `Sidebar-${[this.side, this.sideWidth, this.contentMin, this.space].join('')}`;
      this.dataset.i = this.i;
      if (!document.getElementById(this.i)) {
        const styleEl = document.createElement('style');
        styleEl.id = this.i;
        styleEl.innerHTML = `
          [data-i="${this.i}"] {
            gap: ${this.space};
            ${this.noStretch ? 'align-items: flex-start;' : ''}
          }
          [data-i="${this.i}"] > * {
            ${this.sideWidth ? `flex-basis: ${this.sideWidth};` : ''}
          }
          [data-i="${this.i}"] > ${this.side !== 'left' ? `:first-child` : `:last-child`} {
            flex-basis: 0;
            flex-grow: 999;
            min-inline-size: ${this.contentMin};
          }
        `.replace(/\s\s+/g, ' ').trim();
        document.head.appendChild(styleEl);
      }
    }
  }

  get side() { return this.getAttribute('side') || 'left'; }
  set side(val) { this.setAttribute('side', val); }
  get sideWidth() { return this.getAttribute('sideWidth') || null; }
  set sideWidth(val) { this.setAttribute('sideWidth', val); }
  get contentMin() { return this.getAttribute('contentMin') || '50%'; }
  set contentMin(val) { this.setAttribute('contentMin', val); }
  get space() { return this.getAttribute('space') || 'var(--space-l)'; }
  set space(val) { this.setAttribute('space', val); }
  get noStretch() { return this.hasAttribute('noStretch'); }
  set noStretch(val) { val ? this.setAttribute('noStretch', '') : this.removeAttribute('noStretch'); }
  static get observedAttributes() { return ['side', 'sideWidth', 'contentMin', 'space', 'noStretch']; }
  connectedCallback() { this.render(); }
  attributeChangedCallback() { this.render(); }
}

customElements.define('sidebar-l', Sidebar);
