## WebRTC for Nim https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API
## * When reading documentation of this module "ICE" means "Interactive Connectivity Establishments".
## * The API is very big and very complicated, for simple things maybe try WebSockets ?.
# The API is very poorly documented in general from the JavaScript side.

import std/asyncjs
from std/jsffi import JsObject
from std/dom import Blob
from std/dom import Node

type
  RTCSessionDescription* = ref object of JsRoot                ## https://developer.mozilla.org/en-US/docs/Web/API/RTCSessionDescription
    sdp*:                        cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCSessionDescription/sdp
    `type`*:                     cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCSessionDescription/type

  RTCIceCandidate* = ref object of JsRoot                      ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate
    address*:                    cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate/address
    candidate*:                  cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate/candidate
    component*:                  cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate/component
    foundation*:                 cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate/foundation
    port*:                       uint16                        ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate/port
    priority*:                   uint                          ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate/priority
    protocol*:                   cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate/protocol
    relatedAddress*:             cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate/relatedAddress
    relatedPort*:                uint16                        ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate/relatedPort
    sdpMid*:                     cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate/sdpMid
    sdpMLineIndex*:              int                           ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate/sdpMLineIndex
    tcpType*:                    cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate/tcpType
    `type`*:                     cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate/type
    usernameFragment*:           cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidate/usernameFragment

  RTCIdentityAssertion* = ref object of JsRoot                 ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIdentityAssertion
    idp*:                        cstring                       ## ?
    name*:                       cstring                       ## ?

  RTCPeerConnection* = ref object of JsRoot                    ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection
    canTrickleIceCandidates*:    bool                          ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/canTrickleIceCandidates
    connectionState*:            cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/connectionState
    currentLocalDescription*:    JsObject                      ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/currentLocalDescription
    currentRemoteDescription*:   JsObject                      ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/currentRemoteDescription
    iceConnectionState*:         cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/iceConnectionState
    iceGatheringState*:          cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/iceGatheringState
    localDescription*:           JsObject                      ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/localDescription
    peerIdentity*:               Future[RTCIdentityAssertion]  ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/peerIdentity
    pendingLocalDescription*:    RTCSessionDescription         ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/pendingLocalDescription
    pendingRemoteDescription*:   RTCSessionDescription         ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/pendingRemoteDescription
    remoteDescription*:          RTCSessionDescription         ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/remoteDescription
    sctp*:                       RTCSctpTransport              ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/sctp
    signalingState*:             cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/signalingState

  RTCPeerConnectionIceEvent* = ref object of JsRoot            ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnectionIceEvent
    candidate*:                  RTCIceCandidate               ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnectionIceEvent/candidate

  RTCPeerConnectionIceErrorEvent* = ref object of JsRoot       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnectionIceErrorEvent
    address*:                    cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnectionIceErrorEvent/address
    errorCode*:                  uint                          ## ?
    errorText*:                  cstring                       ## ?
    port*:                       uint16                        ## ?
    url*:                        cstring                       ## ?

  RTCCertificate* = ref object of JsRoot                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCCertificate
    expires*:                    cstring                       ## ?

  RTCRtpSender* = ref object of JsRoot                         ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpSender
    dtmf*:                       RTCDTMFSender                 ## ?
    track*:                      MediaStreamTrack              ## ?
    transport*:                  RTCDtlsTransport              ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpSender/transport

  RTCRtpReceiver* = ref object of JsRoot                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpReceiver
    track*:                      MediaStreamTrack              ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpReceiver/track
    transport*:                  RTCDtlsTransport              ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpReceiver/transport

  RTCRtpTransceiver* = ref object of JsRoot                    ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpTransceiver
    currentDirection*:           cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpTransceiver/currentDirection
    direction*:                  cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpTransceiver/direction
    mid*:                        cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpTransceiver/mid
    receiver*:                   RTCRtpReceiver                ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpTransceiver/receiver
    sender*:                     RTCRtpSender                  ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpTransceiver/sender
    stopped*:                    bool                          ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpTransceiver/stopped

  RTCDtlsTransport* = ref object of JsRoot                     ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDtlsTransport
    iceTransport*:               RTCIceTransport               ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDtlsTransport/iceTransport
    state*:                      cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDtlsTransport/state

  RTCIceTransport* = ref object of JsRoot                      ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceTransport
    component*:                  cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceTransport/component
    gatheringState*:             cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceTransport/gatheringState
    role*:                       cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceTransport/role
    state*:                      cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceTransport/state

  RTCTrackEvent* = ref object of JsRoot                        ## https://developer.mozilla.org/en-US/docs/Web/API/RTCTrackEvent
    receiver*:                   RTCRtpTransceiver             ## https://developer.mozilla.org/en-US/docs/Web/API/RTCTrackEvent/receiver
    streams*:                    seq[MediaStream]              ## https://developer.mozilla.org/en-US/docs/Web/API/RTCTrackEvent/streams
    track*:                      MediaStreamTrack              ## https://developer.mozilla.org/en-US/docs/Web/API/RTCTrackEvent/track
    transceiver*:                RTCRtpTransceiver             ## https://developer.mozilla.org/en-US/docs/Web/API/RTCTrackEvent/transceiver

  RTCSctpTransport* = ref object of JsRoot                     ## https://developer.mozilla.org/en-US/docs/Web/API/RTCSctpTransport
    state*:                      cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCSctpTransport/state

  RTCDataChannel* = ref object of JsRoot                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannel
    binaryType*:                 cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannel/binaryType
    bufferedAmount*:             int                           ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannel/bufferedAmount
    bufferedAmountLowThreshold*: int                           ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannel/bufferedAmountLowThreshold
    id*:                         uint                          ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannel/id
    label*:                      cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannel/label
    maxPacketLifeTime*:          int                           ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannel/maxPacketLifeTime
    maxRetransmits*:             int                           ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannel/maxRetransmits
    negotiated*:                 bool                          ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannel/negotiated
    ordered*:                    bool                          ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannel/ordered
    protocol*:                   cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannel/protocol
    readyState*:                 cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannel/readyState
    reliable*:                   bool                          ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannel/reliable

  RTCDataChannelEvent* = ref object of JsRoot                  ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannelEvent
    channel*:                    RTCDataChannel                ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDataChannelEvent/channel

  RTCDTMFSender* = ref object of JsRoot                        ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDTMFSender
    toneBuffer*:                 cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDTMFSender/toneBuffer

  RTCDTMFToneChangeEvent* = ref object of JsRoot               ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDTMFToneChangeEvent
    tone*:                       cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCDTMFToneChangeEvent/tone

  RTCStatsReport* = ref object of JsRoot                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCStatsReport

  RTCError* = ref object of JsRoot                             ## https://developer.mozilla.org/en-US/docs/Web/API/RTCError
    errorDetail*:                cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCError/errorDetail
    receivedAlert*:              uint                          ## https://developer.mozilla.org/en-US/docs/Web/API/RTCError/receivedAlert
    sctpCauseCode*:              uint                          ## https://developer.mozilla.org/en-US/docs/Web/API/RTCError/sctpCauseCode
    sdpLineNumber*:              uint                          ## https://developer.mozilla.org/en-US/docs/Web/API/RTCError/sdpLineNumber
    sentAlert*:                  uint                          ## https://developer.mozilla.org/en-US/docs/Web/API/RTCError/sentAlert

  RTCErrorEvent* = ref object of JsRoot                        ## https://developer.mozilla.org/en-US/docs/Web/API/RTCErrorEvent
    error*:                      RTCError                      ## https://developer.mozilla.org/en-US/docs/Web/API/RTCErrorEvent/error

  RTCRtpCodecCapability* = ref object of JsRoot                ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpCodecCapability
    channels*:                   uint                          ## ?
    clockRate*:                  uint                          ## ?
    mimetype*:                   cstring                       ## ?
    sdpFmtpLine*:                cstring                       ## ?

  RTCRtpCapabilities* = ref object of JsRoot                   ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpCapabilities
    codecs*:                     seq[RTCRtpCodecCapability]    ## ?
    headerExtensions*:           seq[JsObject]                 ## ?

  MediaStream* = ref object of JsRoot                          ## https://developer.mozilla.org/en-US/docs/Web/API/MediaStream
    active*:                     bool                          ## https://developer.mozilla.org/en-US/docs/Web/API/MediaStream/active
    id*:                         cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/MediaStream/id

  MediaStreamTrack* = ref object of JsRoot                     ## https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack
    contentHint*:                cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack/contentHint
    enabled*:                    bool                          ## https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack/enabled
    id*:                         cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack/id
    kind*:                       cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack/kind
    label*:                      cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack/label
    muted*:                      bool                          ## https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack/muted
    readyState*:                 cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack/readyState
    remote*:                     bool                          ## https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrack/remote

  RTCRtpCodecCapabilities* = ref object of JsRoot

  RTCRtpEncodingParameters* = ref object of JsRoot             ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpEncodingParameters
    active*:                     bool                          ## ?
    codecPayloadType*:           cstring or int                ## ?
    dtx*:                        cstring                       ## ?
    maxBitrate*:                 uint                          ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpEncodingParameters/maxBitrate
    maxFramerate*:               float                         ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpEncodingParameters/maxFramerate
    scaleResolutionDownBy*:      float                         ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpEncodingParameters/scaleResolutionDownBy
    ptime*:                      uint                          ## ?
    rid*:                        cstring                       ## ?

  RTCRtpSendParameters* = ref object of JsRoot                 ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpSendParameters
    encodings*:                  seq[RTCRtpEncodingParameters] ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpSendParameters/encodings

  RTCRtpContributingSource* = ref object of JsRoot             ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpContributingSource
    audioLevel*:                 float                         ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpContributingSource/audioLevel
    rtpTimestamp*:               int                           ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpContributingSource/rtpTimestamp
    source*:                     uint32                        ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpContributingSource/source
    timestamp*:                  Node                          ##  https://developer.mozilla.org/en-US/docs/Web/API/RTCRtpContributingSource/timestamp

  RTCRtcpParameters* = ref object of JsRoot                    ## https://developer.mozilla.org/en-US/docs/Web/API/RTCRtcpParameters
    cname*:                      cstring                       ## ?
    reducedSize*:                bool                          ## ?

  RTCRtpReceiveParameters* = ref object of JsRoot              ##
    codecs*:                     seq[RTCRtpCodecCapability]    ## ?
    headerExtensions*:           seq[JsObject]                 ## ?
    rtcp*:                       RTCRtcpParameters

  RTCIceParameters* = ref object of JsRoot                     ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceParameters
    password*:                   cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceParameters/password
    usernameFragment*:           cstring                       ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceParameters/usernameFragment

  RTCIceCandidatePair* = ref object of JsRoot                  ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidatePair
    local*:                      RTCIceCandidate               ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidatePair/local
    remote*:                     RTCIceCandidate               ## https://developer.mozilla.org/en-US/docs/Web/API/RTCIceCandidatePair/remote

  MediaTrackConstraints* = ref object of JsRoot                ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints
    aspectRatio*:                SomeNumber or JsObject        ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/aspectRatio
    autoGainControl*:            bool                          ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/autoGainControl
    channelCount*:               int                           ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/channelCount
    deviceId*:                   JsObject                      ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/deviceId
    displaySurface*:             cstring or JsObject           ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/displaySurface
    echoCancellation*:           bool                          ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/echoCancellation
    facingMode*:                 cstring or JsObject           ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/facingMode
    frameRate*:                  SomeNumber or JsObject        ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/frameRate
    groupId*:                    cstring or JsObject           ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/groupId
    height*:                     SomeNumber                    ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/height
    latency*:                    SomeNumber or JsObject        ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/latency
    logicalSurface*:             bool or JsObject              ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/logicalSurface
    noiseSuppression*:           bool                          ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/noiseSuppression
    sampleRate*:                 SomeNumber                    ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/sampleRate
    sampleSize*:                 SomeNumber                    ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/sampleSize
    volume*:                     SomeNumber or JsObject        ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/volume
    width*:                      SomeNumber                    ## https://developer.mozilla.org/en-US/docs/Web/API/MediaTrackConstraints/width

  MediaTrackSettings* = ref object of JsRoot
    aspectRatio*:                SomeNumber or JsObject
    autoGainControl*:            bool
    channelCount*:               int
    deviceId*:                   JsObject
    displaySurface*:             cstring or JsObject
    echoCancellation*:           bool
    facingMode*:                 cstring or JsObject
    frameRate*:                  SomeNumber or JsObject
    groupId*:                    cstring or JsObject
    height*:                     SomeNumber
    latency*:                    SomeNumber or JsObject
    logicalSurface*:             bool or JsObject
    noiseSuppression*:           bool
    sampleRate*:                 SomeNumber
    sampleSize*:                 SomeNumber
    volume*:                     SomeNumber or JsObject
    width*:                      SomeNumber

func newRTCPeerConnection*(configuration: JsObject): RTCPeerConnection {.importjs: "(new RTCPeerConnection(#))".}

func newRTCPeerConnection*(): RTCPeerConnection {.importjs: "(new RTCPeerConnection(@))".}

func newRTCSessionDescription*(options: JsObject): RTCSessionDescription {.importjs: "(new RTCSessionDescription(#))".}

func newRTCSessionDescription*(): RTCSessionDescription {.importjs: "(new RTCSessionDescription())".}

func newRTCIceCandidate*(candidateInfo: JsObject): RTCIceCandidate {.importjs: "(new RTCIceCandidate(#))".}

func newRTCIceCandidate*(): RTCIceCandidate {.importjs: "(new RTCIceCandidate())".}

func newRTCPeerConnectionIceEvent*(tipe: cstring; options: JsObject): RTCPeerConnectionIceEvent {.importjs: "(new RTCPeerConnectionIceEvent(#, #))".}

func newRTCPeerConnectionIceEvent*(tipe: cstring): RTCPeerConnectionIceEvent {.importjs: "(new RTCPeerConnectionIceEvent(#, {candidate: null, url: null}))".}

func newRTCPeerConnectionIceErrorEvent*(): RTCPeerConnectionIceErrorEvent {.importjs: "(new RTCPeerConnectionIceErrorEvent())".}

func newRTCCertificate*(): RTCCertificate {.importjs: "(new RTCCertificate())".}

func newRTCRtpSender*(): RTCRtpSender {.importjs: "(new RTCRtpSender())".}

func newRTCRtpReceiver*(): RTCRtpReceiver {.importjs: "(new RTCRtpReceiver())".}

func newRTCRtpTransceiver*(): RTCRtpTransceiver {.importjs: "(new RTCRtpTransceiver())".}

func newRTCDtlsTransport*(): RTCDtlsTransport {.importjs: "(new RTCDtlsTransport())".}

func newRTCIceTransport*(): RTCIceTransport {.importjs: "(new RTCIceTransport())".}

func newRTCTrackEvent*(tipe: cstring; options: JsObject): RTCTrackEvent {.importjs: "(new RTCTrackEvent(#, #))".}

func newRTCSctpTransport*(): RTCSctpTransport {.importjs: "(new RTCSctpTransport())".}

func newRTCDataChannel*(): RTCDataChannel {.importjs: "(new RTCDataChannel())".}

func newRTCDataChannelEvent*(tipe: cstring; options: JsObject): RTCDataChannelEvent {.importjs: "(new RTCDataChannelEvent(#, #))".}

func newRTCDTMFSender*(): RTCDTMFSender {.importjs: "(new RTCDTMFSender())".}

func newRTCDTMFToneChangeEvent*(tipe: cstring; options: JsObject): RTCDTMFToneChangeEvent {.importjs: "(new RTCDTMFToneChangeEvent(#, #))".}

func newRTCDTMFToneChangeEvent*(tipe: cstring): RTCDTMFToneChangeEvent {.importjs: "(new RTCDTMFToneChangeEvent(#))".}

func newRTCStatsReport*(): RTCStatsReport {.importjs: "(new RTCStatsReport())".}

func newRTCErrorEvent*(): RTCErrorEvent {.importjs: "(new RTCErrorEvent())".}

func newRTCError*(): RTCError {.importjs: "(new RTCError())".}

func newRTCIdentityAssertion*(): RTCIdentityAssertion {.importjs: "(new RTCIdentityAssertion())".}

func newRTCRtpCodecCapability*(): RTCRtpCodecCapability {.importjs: "(new RTCRtpCodecCapability())".}

func newRTCRtpCodecCapabilities*(): RTCRtpCodecCapabilities {.importjs: "(new RTCRtpCodecCapabilities())".}

func newMediaStream*(): MediaStream {.importjs: "(new MediaStream())".}

func newMediaStream*(stream: MediaStream): MediaStream {.importjs: "(new MediaStream(#))".}

func newMediaStream*(tracks: seq[MediaStreamTrack]): MediaStream {.importjs: "(new MediaStream(#))".}

func newMediaTrackConstraints*(): MediaTrackConstraints {.importjs: "(new MediaTrackConstraints())".}

func newMediaTrackSettings*(): MediaTrackSettings {.importjs: "(new MediaTrackSettings())".}

func newRTCIceCandidatePair*(): RTCIceCandidatePair {.importjs: "(new RTCIceCandidatePair())".}

func newRTCIceParameters*(): RTCIceParameters {.importjs: "(new RTCIceParameters())".}

func newRTCRtcpParameters*(): RTCRtcpParameters {.importjs: "(new RTCRtcpParameters())".}

func newRTCRtpCapabilities*(): RTCRtpCapabilities {.importjs: "(new RTCRtpCapabilities())".}

func newRTCRtpContributingSource*(): RTCRtpContributingSource {.importjs: "(new RTCRtpContributingSource())".}

func newRTCRtpEncodingParameters*(): RTCRtpEncodingParameters {.importjs: "(new RTCRtpEncodingParameters())".}

func newRTCRtpReceiveParameters*(): RTCRtpReceiveParameters {.importjs: "(new RTCRtpReceiveParameters())".}

func newRTCRtpSendParameters*(): RTCRtpSendParameters {.importjs: "(new RTCRtpSendParameters())".}

{.push importcpp.}

func toJSON*(self: RTCSessionDescription or RTCIceCandidate): JsObject

func generateCertificate*(self: RTCPeerConnection; keygenAlgorithm: cstring): RTCCertificate

func addIceCandidate*(self: RTCPeerConnection; candidate: RTCIceCandidate; successCallback, failureCallback: auto): Future[void]

func addIceCandidate*(self: RTCPeerConnection; candidate: RTCIceCandidate; successCallback: auto): Future[void]

func addIceCandidate*(self: RTCPeerConnection; candidate: RTCIceCandidate): Future[void]

func addStream*(self: RTCPeerConnection; mediaStream: MediaStream)

func addTrack*(self: RTCPeerConnection; track: MediaStreamTrack; streams: MediaStream): RTCRtpSender {.varargs.}

func addTrack*(self: RTCPeerConnection; track: MediaStreamTrack): RTCRtpSender

func addTransceiver*(self: RTCPeerConnection; trackOrKind: MediaStreamTrack; init: auto): RTCRtpTransceiver

func addTransceiver*(self: RTCPeerConnection; trackOrKind: MediaStreamTrack): RTCRtpTransceiver

func close*(self: RTCPeerConnection or RTCDataChannel)

func createAnswer*(self: RTCPeerConnection): Future[void]

func createAnswer*(self: RTCPeerConnection; options: JsObject): Future[void]

func createAnswer*(self: RTCPeerConnection; successCallback, failureCallback: auto; options: JsObject): Future[void]

func createAnswer*(self: RTCPeerConnection; successCallback, failureCallback: auto): Future[void]

func createDataChannel*(self: RTCPeerConnection; label: cstring; options: JsObject): RTCDataChannel

func createDataChannel*(self: RTCPeerConnection; label: cstring): RTCDataChannel

func createOffer*(self: RTCPeerConnection; options: JsObject): Future[void]

func createOffer*(self: RTCPeerConnection): Future[void]

func createOffer*(self: RTCPeerConnection; successCallback, failureCallback: auto; options: JsObject): Future[void]

func createOffer*(self: RTCPeerConnection; successCallback, failureCallback: auto): Future[void]

func getConfiguration*(self: RTCPeerConnection): JsObject

func getIdentityAssertion*(self: RTCPeerConnection): Future[cstring]

func getSenders*(self: RTCPeerConnection): seq[RTCRtpSender]

func getStats*(self: RTCPeerConnection; selector: MediaStreamTrack): Future[RTCStatsReport]

func getStats*(self: RTCPeerConnection or RTCRtpReceiver): Future[RTCStatsReport]

func getStream*(self: RTCPeerConnection; id: cstring): MediaStream

func getTransceivers*(self: RTCPeerConnection): seq[RTCRtpTransceiver]

func removeStream*(self: RTCPeerConnection; mediaStream: MediaStream)

func removeTrack*(self: RTCPeerConnection; sender: RTCRtpSender)

func restartIce*(self: RTCPeerConnection)

func setConfiguration*(self: RTCPeerConnection; configuration: JsObject)

func setIdentityProvider*(self: RTCPeerConnection; domainname, protocol, username: cstring)

func setIdentityProvider*(self: RTCPeerConnection; domainname, protocol: cstring)

func setIdentityProvider*(self: RTCPeerConnection; domainname: cstring)

func setLocalDescription*(self: RTCPeerConnection; sessionDescription: RTCSessionDescription; successCallback, errorCallback: auto): Future[cstring]

func setRemoteDescription*(self: RTCPeerConnection; sessionDescription: RTCSessionDescription): Future[cstring]

func getCapabilities*(self: RTCRtpSender or RTCRtpReceiver; kind: cstring): RTCRtpCapabilities

func getParameters*(self: RTCRtpSender): RTCRtpSendParameters

func getStats*(self: RTCRtpSender): Future[RTCStatsReport]

func replaceTrack*(self: RTCRtpSender; newTrack: MediaStreamTrack): Future[MediaStreamTrack]

func setParameters*(self: RTCRtpSender; parameters: RTCRtpSendParameters): Future[void]

func setStreams*(self: RTCRtpSender; mediaStreams: MediaStream)

func setStreams*(self: RTCRtpSender)

func getContributingSources*(self: RTCRtpReceiver): seq[RTCRtpContributingSource]

func getParameters*(self: RTCRtpReceiver): RTCRtpReceiveParameters

func getSynchronizationSources*(self: RTCRtpReceiver): seq[JsObject]

func setCodecPreferences*(self: RTCRtpReceiver; codecs: seq[RTCRtpCodecCapability])

func stop*(self: RTCRtpReceiver or MediaStreamTrack)

func getLocalCandidates*(self: RTCIceTransport): seq[RTCIceCandidate]

func getLocalParameters*(self: RTCIceTransport): RTCIceParameters

func getRemoteCandidates*(self: RTCIceTransport): seq[RTCIceCandidate]

func getRemoteParameters*(self: RTCIceTransport): RTCIceParameters

func getSelectedCandidatePair*(self: RTCIceTransport): RTCIceCandidatePair

func send*(self: RTCDataChannel; data: string or Blob)

func insertDTMF*(self: RTCDTMFSender; tones: cstring; duration: 40 .. 6000; interToneGap: 30 .. int.high)

func insertDTMF*(self: RTCDTMFSender; tones: cstring; duration: 40 .. 6000)

func insertDTMF*(self: RTCDTMFSender; tones: cstring)

func addTrack*(self: MediaStream; track: MediaStreamTrack)

func clone*(self: MediaStream): MediaStream

func getAudioTracks*(self: MediaStream): seq[MediaStreamTrack]

func getTrackById*(self: MediaStream; id: cstring): MediaStreamTrack

func getTracks*(self: MediaStream): seq[MediaStreamTrack]

func getVideoTracks*(self: MediaStream): seq[MediaStreamTrack]

func applyConstraints*(self: MediaStreamTrack; constraints: MediaTrackConstraints): Future[void]

func applyConstraints*(self: MediaStreamTrack): Future[void]

func clone*(self: MediaStreamTrack): MediaStreamTrack

func getCapabilities*(self: MediaStreamTrack): JsObject

func getConstraints*(self: MediaStreamTrack): MediaTrackConstraints

func getSettings*(self: MediaStreamTrack): MediaTrackSettings

{.pop.}
