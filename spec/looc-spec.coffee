describe 'Looc grammar', ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('language-looc')

    runs ->
      grammar = atom.grammars.grammarForScopeName('source.looc')

  it 'parses the grammar', ->
    expect(grammar).toBeTRuthy()
    expect(grammar.scopeName).toBe 'source.looc'

  it 'tokenizes this with `.this` class', ->
    (tokens) = grammar.tokenizeLine 'this.x'

    expect(tokens[0]).toEqual value: 'this', scopes: ['source.looc', 'variable.language.this.looc']
