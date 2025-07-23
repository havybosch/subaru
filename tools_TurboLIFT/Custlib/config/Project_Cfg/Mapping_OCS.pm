package LIFT_PROJECT;

###############################
$VERSION = q$Revision: 1.0 $;
$HEADER  = q$Header: config/Mapping_EOL.pm 1.0 25/01/2024 1:40:00 PM Ly Kim Nguyen Ban (MS/EAA43-CC) develop $;
###############################

$Defaults->{'Mapping_OCS'} = {
	'CommandType' => {
		'StatusCommand' => {
			'request' => {
				'Header'       => '91 08 33',
				'TrigerFactor' => 'NA',
			},
			'response' => {
				'Header'       => '61 09 33',
				'TrigerFactor' => 'NA',
			},
		},
		'MemoryReadCommandSerialRead' => {
			'request' => {
				'Header'       => '91 06 01',
				'TrigerFactor' => 'NA',
			},
			'response' => {
				'Header'       => '61 xx 01',
				'TrigerFactor' => 'NA',
			},
		},
		'MemoryReadCommandDetailFltCode' => {
			'request' => {
				'Header'       => '91 06 01',
				'TrigerFactor' => 'ReadDataByIdentifier_ReadOcsFaultCode',
			},
			'response' => {
				'Header'       => '61 xx 01',
				'TrigerFactor' => 'ReadDataByIdentifier_ReadOcsFaultCode',
			},

		},
	},
};    #end of Mapping_OCS
1;

