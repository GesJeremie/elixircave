import Ember from 'ember';

export function markdownDecode([content]) {
  return markdown.toHTML(content);
}

export default Ember.Helper.helper(markdownDecode);
