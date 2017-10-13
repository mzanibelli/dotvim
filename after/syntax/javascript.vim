syntax clear

syn keyword javaScriptSource         import export from
syn keyword javaScriptIdentifier     arguments this let var void yield async await const
syn keyword javaScriptOperator       delete new instanceof typeof
syn keyword javaScriptBoolean        true false
syn keyword javaScriptNull           null undefined
syn keyword javaScriptMessage        alert confirm prompt status
syn keyword javaScriptGlobal         self top parent
syn keyword javaScriptDeprecated     escape unescape all applets alinkColor bgColor fgColor linkColor vlinkColor xmlEncoding
syn keyword javaScriptConditional    if else switch
syn keyword javaScriptRepeat         do while for in of
syn keyword javaScriptBranch         break continue
syn keyword javaScriptLabel          case default
syn keyword javaScriptPrototype      prototype
syn keyword javaScriptStatement      return with
syn keyword javaScriptGlobalObjects  Array Boolean Date Function Math Number Object RegExp String
syn keyword javaScriptExceptions     try catch throw finally Error EvalError RangeError ReferenceError SyntaxError TypeError URIError
syn keyword javaScriptReserved       abstract enum int short boolean export interface static byte extends long super char final native synchronized class float package throws goto private transient debugger implements protected volatile double import public
syn keyword javaScriptCommentTodo      TODO FIXME XXX TBD OPTIMIZE HACK REVIEW contained
syn match   javaScriptLineComment      "\/\/.*" contains=@Spell,javaScriptCommentTodo
syn match   javaScriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  javaScriptComment          start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo
syn case match
syn match   javaScriptSpecial          "\\\d\d\d\|\\."
syn region  javaScriptString	          start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=javaScriptSpecial,@htmlPreproc
syn region  javaScriptString	          start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=javaScriptSpecial,@htmlPreproc
syn match   javaScriptSpecialCharacter "'\\.'"
syn match   javaScriptNumber           "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  javaScriptRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gim]\{0,2\}\s*$+ end=+/[gim]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline
syn match   javaScriptFloat          /\<-\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
syn keyword javaScriptBrowserObjects           window navigator screen history location console
syn keyword javaScriptDOMObjects               document event HTMLElement Anchor Area Base Body Button Form Frame Frameset Image Link Meta Option Select Style Table TableCell TableRow Textarea
syn keyword javaScriptDOMMethods               createTextNode createElement insertBefore replaceChild removeChild appendChild  hasChildNodes  cloneNode  normalize  isSupported  hasAttributes  getAttribute  setAttribute  removeAttribute  getAttributeNode  setAttributeNode  removeAttributeNode  getElementsByTagName  hasAttribute  getElementById adoptNode close compareDocumentPosition createAttribute createCDATASection createComment createDocumentFragment createElementNS createEvent createExpression createNSResolver createProcessingInstruction createRange createTreeWalker elementFromPoint evaluate getBoxObjectFor getElementsByClassName getSelection getUserData hasFocus importNode
syn keyword javaScriptDOMProperties            nodeName  nodeValue  nodeType  parentNode  childNodes  firstChild  lastChild  previousSibling  nextSibling  attributes  ownerDocument  namespaceURI  prefix  localName  tagName
syn keyword javaScriptAjaxObjects              XMLHttpRequest
syn keyword javaScriptAjaxProperties           readyState responseText responseXML statusText
syn keyword javaScriptAjaxMethods              onreadystatechange abort getAllResponseHeaders getResponseHeader open send setRequestHeader
syn keyword javaScriptPropietaryObjects        ActiveXObject
syn keyword javaScriptPropietaryMethods        attachEvent detachEvent cancelBubble returnValue
syn keyword javaScriptHtmlElemProperties       className  clientHeight  clientLeft  clientTop  clientWidth  dir  href  id  innerHTML  lang  length  offsetHeight  offsetLeft  offsetParent  offsetTop  offsetWidth  scrollHeight  scrollLeft  scrollTop  scrollWidth  style  tabIndex  target  title
syn keyword javaScriptEventListenerKeywords    blur click focus mouseover mouseout load item
syn keyword javaScriptEventListenerMethods     scrollIntoView  addEventListener  dispatchEvent  removeEventListener preventDefault stopPropagation
syn keyword javaScriptWebAPI  AbstractWorker AnalyserNode AnimationEvent App Apps ArrayBuffer ArrayBufferView Attr AudioBuffer AudioBufferSourceNode AudioContext AudioDestinationNode AudioListener AudioNode AudioParam AudioProcessingEvent BatteryManager BiquadFilterNode Blob BlobBuilder BlobEvent CallEvent CameraCapabilities CameraControl CameraManager CanvasGradient CanvasImageSource CanvasPattern CanvasPixelArray CanvasRenderingContext2D CaretPosition CDATASection ChannelMergerNode ChannelSplitterNode CharacterData ChildNode ChromeWorker ClipboardEvent CloseEvent Comment CompositionEvent Connection Console ContactManager ConvolverNode Coordinates CSS CSSConditionRule CSSGroupingRule CSSKeyframeRule CSSKeyframesRule CSSMediaRule CSSNamespaceRule CSSPageRule CSSRule CSSRuleList CSSStyleDeclaration CSSStyleRule CSSStyleSheet CSSSupportsRule CustomEvent
syn keyword javaScriptWebAPI  DataTransfer DataView DedicatedWorkerGlobalScope DelayNode DeviceAcceleration DeviceLightEvent DeviceMotionEvent DeviceOrientationEvent DeviceProximityEvent DeviceRotationRate DeviceStorage DeviceStorageChangeEvent DirectoryEntry DirectoryEntrySync DirectoryReader DirectoryReaderSync Document DocumentFragment DocumentTouch DocumentType DOMConfiguration DOMCursor DOMError DOMErrorHandler DOMException DOMHighResTimeStamp DOMImplementation DOMImplementationList DOMImplementationSource DOMLocator DOMObject DOMParser DOMRequest DOMString DOMStringList DOMStringMap DOMTimeStamp DOMTokenList DOMUserData DynamicsCompressorNode
syn keyword javaScriptWebAPI  Element ElementTraversal Entity EntityReference Entry EntrySync ErrorEvent Event EventListener EventSource EventTarget Extensions File FileEntry FileEntrySync FileError FileException FileList FileReader FileSystem FileSystemSync Float32Array Float64Array FMRadio FocusEvent FormData GainNode Geolocation History
syn keyword javaScriptWebAPI  HTMLAnchorElement HTMLAreaElement HTMLAudioElement HTMLBaseElement HTMLBaseFontElement HTMLBodyElement HTMLBRElement HTMLButtonElement HTMLCanvasElement HTMLCollection HTMLDataElement HTMLDataListElement HTMLDivElement HTMLDListElement HTMLDocument HTMLElement HTMLEmbedElement HTMLFieldSetElement HTMLFormControlsCollection HTMLFormElement HTMLHeadElement HTMLHeadingElement HTMLHRElement HTMLHtmlElement HTMLIFrameElement HTMLImageElement HTMLInputElement HTMLIsIndexElement HTMLKeygenElement HTMLLabelElement HTMLLegendElement HTMLLIElement HTMLLinkElement HTMLMapElement HTMLMediaElement HTMLMetaElement HTMLMeterElement HTMLModElement HTMLObjectElement HTMLOListElement HTMLOptGroupElement HTMLOptionElement HTMLOptionsCollection HTMLOutputElement HTMLParagraphElement HTMLParamElement HTMLPreElement HTMLProgressElement HTMLQuoteElement HTMLScriptElement HTMLSelectElement HTMLSourceElement HTMLSpanElement HTMLStyleElement HTMLTableCaptionElement HTMLTableCellElement HTMLTableColElement HTMLTableElement HTMLTableRowElement HTMLTableSectionElement HTMLTextAreaElement HTMLTimeElement HTMLTitleElement HTMLTrackElement HTMLUListElement HTMLUnknownElement HTMLVideoElement
syn keyword javaScriptWebAPI  IDBCursor IDBCursorWithValue IDBDatabase IDBDatabaseException IDBEnvironment IDBFactory IDBIndex IDBKeyRange IDBObjectStore IDBOpenDBRequest IDBRequest IDBTransaction IDBVersionChangeEvent ImageData Int16Array Int32Array Int8Array KeyboardEvent LinkStyle LocalFileSystem LocalFileSystemSync Location MediaQueryList MediaQueryListListener MediaSource MediaStream MediaStreamTrack MessageEvent MouseEvent MouseScrollEvent MouseWheelEvent MozActivity MozActivityOptions MozActivityRequestHandler MozAlarmsManager MozContact MozContactChangeEvent MozIccManager MozMmsEvent MozMmsMessage MozMobileCellInfo MozMobileCFInfo MozMobileConnection MozMobileConnectionInfo MozMobileICCInfo MozMobileMessageManager MozMobileMessageThread MozMobileNetworkInfo MozNetworkStats MozNetworkStatsData MozNetworkStatsManager MozSettingsEvent MozSmsEvent MozSmsFilter MozSmsManager MozSmsMessage MozSmsSegmentInfo MozTimeManager MozWifiConnectionInfoEvent MutationObserver
syn keyword javaScriptWebAPI  NamedNodeMap NameList Navigator NavigatorGeolocation NavigatorID NavigatorLanguage NavigatorOnLine NavigatorPlugins NetworkInformation Node NodeFilter NodeIterator NodeList Notation Notification NotifyAudioAvailableEvent OfflineAudioCompletionEvent OfflineAudioContext PannerNode ParentNode Performance PerformanceNavigation PerformanceTiming Plugin PluginArray Position PositionError PositionOptions PowerManager ProcessingInstruction ProgressEvent Promise PromiseResolver PushManager
syn keyword javaScriptWebAPI  Range ScriptProcessorNode Selection SettingsLock SettingsManager SharedWorker StyleSheet StyleSheetList SVGAElement SVGAngle SVGAnimateColorElement SVGAnimatedAngle SVGAnimatedBoolean SVGAnimatedEnumeration SVGAnimatedInteger SVGAnimatedLengthList SVGAnimatedNumber SVGAnimatedNumberList SVGAnimatedPoints SVGAnimatedPreserveAspectRatio SVGAnimatedRect SVGAnimatedString SVGAnimatedTransformList SVGAnimateElement SVGAnimateMotionElement SVGAnimateTransformElement SVGAnimationElement SVGCircleElement SVGClipPathElement SVGCursorElement SVGDefsElement SVGDescElement SVGElement SVGEllipseElement SVGFilterElement SVGFontElement SVGFontFaceElement SVGFontFaceFormatElement SVGFontFaceNameElement SVGFontFaceSrcElement SVGFontFaceUriElement
syn keyword javaScriptWebAPI  SVGForeignObjectElement SVGGElement SVGGlyphElement SVGGradientElement SVGHKernElement SVGImageElement SVGLength SVGLengthList SVGLinearGradientElement SVGLineElement SVGMaskElement SVGMatrix SVGMissingGlyphElement SVGMPathElement SVGNumber SVGNumberList SVGPathElement SVGPatternElement SVGPolygonElement SVGPolylineElement SVGPreserveAspectRatio SVGRadialGradientElement SVGRect SVGRectElement SVGScriptElement SVGSetElement SVGStopElement SVGStringList SVGStylable SVGStyleElement SVGSVGElement SVGSwitchElement SVGSymbolElement SVGTests SVGTextElement SVGTextPositioningElement SVGTitleElement SVGTransform SVGTransformable SVGTransformList SVGTRefElement SVGTSpanElement SVGUseElement SVGViewElement SVGVKernElement TCPSocket Telephony TelephonyCall Text TextDecoder TextEncoder TextMetrics TimeRanges Touch TouchEvent TouchList Transferable TransitionEvent TreeWalker TypeInfo UIEvent Uint16Array Uint32Array Uint8Array Uint8ClampedArray URL URLUtils URLUtilsReadOnly
syn keyword javaScriptDomErrNo       INDEX_SIZE_ERR DOMSTRING_SIZE_ERR HIERARCHY_REQUEST_ERR WRONG_DOCUMENT_ERR INVALID_CHARACTER_ERR NO_DATA_ALLOWED_ERR NO_MODIFICATION_ALLOWED_ERR NOT_FOUND_ERR NOT_SUPPORTED_ERR INUSE_ATTRIBUTE_ERR INVALID_STATE_ERR SYNTAX_ERR INVALID_MODIFICATION_ERR NAMESPACE_ERR INVALID_ACCESS_ERR
syn keyword javaScriptDomNodeConsts  ELEMENT_NODE ATTRIBUTE_NODE TEXT_NODE CDATA_SECTION_NODE ENTITY_REFERENCE_NODE ENTITY_NODE PROCESSING_INSTRUCTION_NODE COMMENT_NODE DOCUMENT_NODE DOCUMENT_TYPE_NODE DOCUMENT_FRAGMENT_NODE NOTATION_NODE
syn case ignore
syn keyword javaScriptHtmlEvents     onblur onclick oncontextmenu ondblclick onfocus onkeydown onkeypress onkeyup onmousedown onmousemove onmouseout onmouseover onmouseup onresize onload onsubmit
syn case match
syn cluster javaScriptAll       contains=javaScriptComment,javaScriptLineComment,javaScriptDocComment,javaScriptString,javaScriptRegexpString,javaScriptNumber,javaScriptFloat,javaScriptLabel,javaScriptSource,javaScriptWebAPI,javaScriptOperator,javaScriptBoolean,javaScriptNull,javaScriptFuncKeyword,javaScriptConditional,javaScriptGlobal,javaScriptRepeat,javaScriptBranch,javaScriptStatement,javaScriptGlobalObjects,javaScriptMessage,javaScriptIdentifier,javaScriptExceptions,javaScriptReserved,javaScriptDeprecated,javaScriptDomErrNo,javaScriptDomNodeConsts,javaScriptHtmlEvents,javaScriptDotNotation,javaScriptBrowserObjects,javaScriptDOMObjects,javaScriptAjaxObjects,javaScriptPropietaryObjects,javaScriptDOMMethods,javaScriptHtmlElemProperties,javaScriptDOMProperties,javaScriptEventListenerKeywords,javaScriptEventListenerMethods,javaScriptAjaxProperties,javaScriptAjaxMethods,javaScriptFuncArg
syn keyword javaScriptFuncKeyword     function contained
syn region  javaScriptFuncExp         start=/\w\+\s\==\s\=function\>/ end="\([^)]*\)" contains=javaScriptFuncEq,javaScriptFuncKeyword,javaScriptFuncArg keepend
syn match   javaScriptFuncArg         "\(([^()]*)\)" contains=javaScriptParens,javaScriptFuncComma contained
syn match   javaScriptFuncComma       /,/ contained
syn match   javaScriptFuncEq          /=/ contained
syn region  javaScriptFuncDef         start="\<function\>" end="\([^)]*\)" contains=javaScriptFuncKeyword,javaScriptFuncArg keepend
syn match   javaScriptObjectKey       /\<[a-zA-Z_$][0-9a-zA-Z_$]*\>\(\s*:\)\@=/ contains=javaScriptFunctionKey
syn match   javaScriptFunctionKey     /\<[a-zA-Z_$][0-9a-zA-Z_$]*\>\(\s*:\s*function\s*\)\@=/ contained
syn match javaScriptBraces       "[{}\[\]]"
syn match javaScriptParens       "[()]"
syn match javaScriptOpSymbols    "=\{1,3}\|!==\|!=\|<\|>\|>=\|<=\|++\|+=\|--\|-="
syn match javaScriptEndColons    "[;,]"
syn match  javaScriptTemplateDelim    "\${\|}" contained
syn region javaScriptTemplateVar      start=+${+ end=+}+                        contains=javaScriptTemplateDelim keepend
syn region javaScriptTemplateString   start=+`+  skip=+\\\(`\|$\)+  end=+`+     contains=javaScriptTemplateVar,javaScriptSpecial keepend
syn cluster  htmlJavaScript contains=@javaScriptAll,javaScriptBracket,javaScriptParen,javaScriptBlock,javaScriptParenError
syn cluster  javaScriptExpression contains=@javaScriptAll,javaScriptBracket,javaScriptParen,javaScriptBlock,javaScriptParenError,@htmlPreproc

hi link javaScriptEndColons             Operator
hi link javaScriptOpSymbols             Operator
hi link javaScriptBraces                Function
hi link javaScriptParens                Operator
hi link javaScriptTemplateDelim         Operator
hi link javaScriptComment               Comment
hi link javaScriptLineComment           Comment
hi link javaScriptDocComment            Comment
hi link javaScriptCommentTodo           Todo
hi link javaScriptDocTags               Special
hi link javaScriptDocSeeTag             Function
hi link javaScriptDocParam              Function
hi link javaScriptString                String
hi link javaScriptRegexpString          String
hi link javaScriptTemplateString        String
hi link javaScriptNumber                Number
hi link javaScriptFloat                 Number
hi link javaScriptGlobal                Constant
hi link javaScriptCharacter             Character
hi link javaScriptPrototype             Type
hi link javaScriptConditional           Conditional
hi link javaScriptBranch                Conditional
hi link javaScriptIdentifier            Identifier
hi link javaScriptRepeat                Repeat
hi link javaScriptStatement             Statement
hi link javaScriptMessage               Keyword
hi link javaScriptReserved              Keyword
hi link javaScriptOperator              Operator
hi link javaScriptNull                  Type
hi link javaScriptBoolean               Boolean
hi link javaScriptLabel                 Label
hi link javaScriptSpecial               Special
hi link javaScriptSource                Special
hi link javaScriptGlobalObjects         Special
hi link javaScriptExceptions            Special
hi link javaScriptDeprecated            Exception
hi link javaScriptError                 Error
hi link javaScriptParensError           Error
hi link javaScriptParensErrA            Error
hi link javaScriptParensErrB            Error
hi link javaScriptParensErrC            Error
hi link javaScriptDomErrNo              Error
hi link javaScriptDomNodeConsts         Constant
hi link javaScriptDomElemAttrs          Label
hi link javaScriptDomElemFuncs          Type
hi link javaScriptWebAPI                Type
hi link javaScriptBrowserObjects        Constant
hi link javaScriptDOMObjects            Constant
hi link javaScriptDOMMethods            Type
hi link javaScriptDOMProperties         Label
hi link javaScriptAjaxObjects           Constant
hi link javaScriptAjaxMethods           Type
hi link javaScriptAjaxProperties        Label
hi link javaScriptFuncKeyword           Function
hi link javaScriptFuncDef               PreProc
hi link javaScriptFuncExp               Title
hi link javaScriptFuncArg               Special
hi link javaScriptFuncComma             Operator
hi link javaScriptFuncEq                Operator
hi link javaScriptHtmlEvents            Constant
hi link javaScriptHtmlElemProperties    Label
hi link javaScriptEventListenerKeywords Type
hi link javaScriptPropietaryObjects     Constant
