/*
 * Copyright 2018-present MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef KMS_RESPONSE_PARSER_H
#define KMS_RESPONSE_PARSER_H

#include "kms_message.h"
#include "kms_response.h"

typedef struct _kms_response_parser_t kms_response_parser_t;

KMS_MSG_EXPORT (kms_response_parser_t *)
kms_response_parser_new (void);

KMS_MSG_EXPORT (int)
kms_response_parser_wants_bytes (kms_response_parser_t *parser, int32_t max);

KMS_MSG_EXPORT (bool)
kms_response_parser_feed (kms_response_parser_t *parser,
                          uint8_t *buf,
                          uint32_t len);

KMS_MSG_EXPORT (kms_response_t *)
kms_response_parser_get_response (kms_response_parser_t *parser);

KMS_MSG_EXPORT (void)
kms_response_parser_destroy (kms_response_parser_t *parser);

#endif /* KMS_RESPONSE_PARSER_H */
