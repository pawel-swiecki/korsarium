class Icon extends HTMLElement {
  constructor() {
    super();
    this.render = () => {
      if (this.label) {
        this.setAttribute('role', 'img');
        this.setAttribute('aria-label', this.label)
      }
      if (this.space) {
        this.i = `Icon-${this.space}`;
        this.dataset.i = this.i;
        if (!document.getElementById(this.i)) {
          const styleEl = document.createElement('style');
          styleEl.id = this.i;
          styleEl.innerHTML = `
            [data-i="${this.i}"] {
              display: inline-flex;
              align-items: baseline;
            }
            [data-i="${this.i}"] > svg {
              margin-inline-end: ${this.space};
            }
          `.replace(/\s\s+/g, ' ').trim();
          document.head.appendChild(styleEl);
        }
      }
    }
  }

  get space() { return this.getAttribute('space') || null; }
  set space(val) { this.setAttribute('space', val); }
  get label() { return this.getAttribute('label') || null; }
  set label(val) { this.setAttribute('label', val); }
  static get observedAttributes() { return ['space', 'label']; }
  connectedCallback() { this.render(); }
  attributeChangedCallback() { this.render(); }
}

customElements.define('icon-l', Icon);
