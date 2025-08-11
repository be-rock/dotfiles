#
# put this file in ~/.ipython/profile_default/startup
# to make the below functions immediately usable upon creation of new ipython sessions
# with a 'default' profile
#

import datetime

def aws_ec2_format_dns_name(dns_name: str) -> str:
    return '.'.join(dns_name.split('.')[0].split('-')[1:])

def aws_parse_arn(arn: str) -> str:
    """parse aws resource arns"""
    keys = ('partition', 'service', 'region', 'account-id', 'resource',)
    split_arn = arn.split(':')[1:]
    return dict(zip(keys, split_arn))

def now() -> str:
    """current timestamp in utc"""
    return datetime.datetime.now(datetime.timezone.utc).isoformat(timespec='microseconds')
