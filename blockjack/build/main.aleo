program blockjack.aleo;

struct Table:
    player_1 as address;
    player_2 as address;
    seed_1 as [u8; 5u32];
    seed_2 as [u8; 5u32];
    deck as [u8; 32u32];
    bet as u64;
    initializer_ready as boolean;
    player_ready as boolean;

struct User:
    score as u64;
    games_played as u64;


mapping users:
	key as field.public;
	value as User.public;

function main:
    input r0 as u32.public;
    input r1 as u32.private;
    add r0 r1 into r2;
    output r2 as u32.private;


function init_game:
    input r0 as [u8; 5u32].private;
    input r1 as u64.private;
    input r2 as Table.private;
    or r2.initializer_ready r2.player_ready into r3;
    cast 0u80u80u80u80u8 into r4 as [u8; 5u32];
    cast 0u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u8 into r5 as [u8; 32u32];
    cast self.signer r2.player_2 r0 r4 r5 r1 true false into r6 as Table;
    ternary r3 r2.player_1 r6.player_1 into r7;
    ternary r3 r2.player_2 r6.player_2 into r8;
    ternary r3 r2.seed_1[0u32] r6.seed_1[0u32] into r9;
    ternary r3 r2.seed_1[1u32] r6.seed_1[1u32] into r10;
    ternary r3 r2.seed_1[2u32] r6.seed_1[2u32] into r11;
    ternary r3 r2.seed_1[3u32] r6.seed_1[3u32] into r12;
    ternary r3 r2.seed_1[4u32] r6.seed_1[4u32] into r13;
    cast r9r10r11r12r13 into r14 as [u8; 5u32];
    ternary r3 r2.seed_2[0u32] r6.seed_2[0u32] into r15;
    ternary r3 r2.seed_2[1u32] r6.seed_2[1u32] into r16;
    ternary r3 r2.seed_2[2u32] r6.seed_2[2u32] into r17;
    ternary r3 r2.seed_2[3u32] r6.seed_2[3u32] into r18;
    ternary r3 r2.seed_2[4u32] r6.seed_2[4u32] into r19;
    cast r15r16r17r18r19 into r20 as [u8; 5u32];
    ternary r3 r2.deck[0u32] r6.deck[0u32] into r21;
    ternary r3 r2.deck[1u32] r6.deck[1u32] into r22;
    ternary r3 r2.deck[2u32] r6.deck[2u32] into r23;
    ternary r3 r2.deck[3u32] r6.deck[3u32] into r24;
    ternary r3 r2.deck[4u32] r6.deck[4u32] into r25;
    ternary r3 r2.deck[5u32] r6.deck[5u32] into r26;
    ternary r3 r2.deck[6u32] r6.deck[6u32] into r27;
    ternary r3 r2.deck[7u32] r6.deck[7u32] into r28;
    ternary r3 r2.deck[8u32] r6.deck[8u32] into r29;
    ternary r3 r2.deck[9u32] r6.deck[9u32] into r30;
    ternary r3 r2.deck[10u32] r6.deck[10u32] into r31;
    ternary r3 r2.deck[11u32] r6.deck[11u32] into r32;
    ternary r3 r2.deck[12u32] r6.deck[12u32] into r33;
    ternary r3 r2.deck[13u32] r6.deck[13u32] into r34;
    ternary r3 r2.deck[14u32] r6.deck[14u32] into r35;
    ternary r3 r2.deck[15u32] r6.deck[15u32] into r36;
    ternary r3 r2.deck[16u32] r6.deck[16u32] into r37;
    ternary r3 r2.deck[17u32] r6.deck[17u32] into r38;
    ternary r3 r2.deck[18u32] r6.deck[18u32] into r39;
    ternary r3 r2.deck[19u32] r6.deck[19u32] into r40;
    ternary r3 r2.deck[20u32] r6.deck[20u32] into r41;
    ternary r3 r2.deck[21u32] r6.deck[21u32] into r42;
    ternary r3 r2.deck[22u32] r6.deck[22u32] into r43;
    ternary r3 r2.deck[23u32] r6.deck[23u32] into r44;
    ternary r3 r2.deck[24u32] r6.deck[24u32] into r45;
    ternary r3 r2.deck[25u32] r6.deck[25u32] into r46;
    ternary r3 r2.deck[26u32] r6.deck[26u32] into r47;
    ternary r3 r2.deck[27u32] r6.deck[27u32] into r48;
    ternary r3 r2.deck[28u32] r6.deck[28u32] into r49;
    ternary r3 r2.deck[29u32] r6.deck[29u32] into r50;
    ternary r3 r2.deck[30u32] r6.deck[30u32] into r51;
    ternary r3 r2.deck[31u32] r6.deck[31u32] into r52;
    cast r21r22r23r24r25r26r27r28r29r30r31r32r33r34r35r36r37r38r39r40r41r42r43r44r45r46r47r48r49r50r51r52 into r53 as [u8; 32u32];
    ternary r3 r2.bet r6.bet into r54;
    ternary r3 r2.initializer_ready r6.initializer_ready into r55;
    ternary r3 r2.player_ready r6.player_ready into r56;
    cast r7 r8 r14 r20 r53 r54 r55 r56 into r57 as Table;
    output r57 as Table.private;


function join_game:
    input r0 as [u8; 5u32].private;
    input r1 as Table.private;
    and r1.initializer_ready r1.player_ready into r2;
    cast 0u80u80u80u80u8 into r3 as [u8; 5u32];
    cast 0u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u80u8 into r4 as [u8; 32u32];
    cast r1.player_1 self.signer r0 r3 r4 r1.bet true false into r5 as Table;
    ternary r2 r1.player_1 r5.player_1 into r6;
    ternary r2 r1.player_2 r5.player_2 into r7;
    ternary r2 r1.seed_1[0u32] r5.seed_1[0u32] into r8;
    ternary r2 r1.seed_1[1u32] r5.seed_1[1u32] into r9;
    ternary r2 r1.seed_1[2u32] r5.seed_1[2u32] into r10;
    ternary r2 r1.seed_1[3u32] r5.seed_1[3u32] into r11;
    ternary r2 r1.seed_1[4u32] r5.seed_1[4u32] into r12;
    cast r8r9r10r11r12 into r13 as [u8; 5u32];
    ternary r2 r1.seed_2[0u32] r5.seed_2[0u32] into r14;
    ternary r2 r1.seed_2[1u32] r5.seed_2[1u32] into r15;
    ternary r2 r1.seed_2[2u32] r5.seed_2[2u32] into r16;
    ternary r2 r1.seed_2[3u32] r5.seed_2[3u32] into r17;
    ternary r2 r1.seed_2[4u32] r5.seed_2[4u32] into r18;
    cast r14r15r16r17r18 into r19 as [u8; 5u32];
    ternary r2 r1.deck[0u32] r5.deck[0u32] into r20;
    ternary r2 r1.deck[1u32] r5.deck[1u32] into r21;
    ternary r2 r1.deck[2u32] r5.deck[2u32] into r22;
    ternary r2 r1.deck[3u32] r5.deck[3u32] into r23;
    ternary r2 r1.deck[4u32] r5.deck[4u32] into r24;
    ternary r2 r1.deck[5u32] r5.deck[5u32] into r25;
    ternary r2 r1.deck[6u32] r5.deck[6u32] into r26;
    ternary r2 r1.deck[7u32] r5.deck[7u32] into r27;
    ternary r2 r1.deck[8u32] r5.deck[8u32] into r28;
    ternary r2 r1.deck[9u32] r5.deck[9u32] into r29;
    ternary r2 r1.deck[10u32] r5.deck[10u32] into r30;
    ternary r2 r1.deck[11u32] r5.deck[11u32] into r31;
    ternary r2 r1.deck[12u32] r5.deck[12u32] into r32;
    ternary r2 r1.deck[13u32] r5.deck[13u32] into r33;
    ternary r2 r1.deck[14u32] r5.deck[14u32] into r34;
    ternary r2 r1.deck[15u32] r5.deck[15u32] into r35;
    ternary r2 r1.deck[16u32] r5.deck[16u32] into r36;
    ternary r2 r1.deck[17u32] r5.deck[17u32] into r37;
    ternary r2 r1.deck[18u32] r5.deck[18u32] into r38;
    ternary r2 r1.deck[19u32] r5.deck[19u32] into r39;
    ternary r2 r1.deck[20u32] r5.deck[20u32] into r40;
    ternary r2 r1.deck[21u32] r5.deck[21u32] into r41;
    ternary r2 r1.deck[22u32] r5.deck[22u32] into r42;
    ternary r2 r1.deck[23u32] r5.deck[23u32] into r43;
    ternary r2 r1.deck[24u32] r5.deck[24u32] into r44;
    ternary r2 r1.deck[25u32] r5.deck[25u32] into r45;
    ternary r2 r1.deck[26u32] r5.deck[26u32] into r46;
    ternary r2 r1.deck[27u32] r5.deck[27u32] into r47;
    ternary r2 r1.deck[28u32] r5.deck[28u32] into r48;
    ternary r2 r1.deck[29u32] r5.deck[29u32] into r49;
    ternary r2 r1.deck[30u32] r5.deck[30u32] into r50;
    ternary r2 r1.deck[31u32] r5.deck[31u32] into r51;
    cast r20r21r22r23r24r25r26r27r28r29r30r31r32r33r34r35r36r37r38r39r40r41r42r43r44r45r46r47r48r49r50r51 into r52 as [u8; 32u32];
    ternary r2 r1.bet r5.bet into r53;
    ternary r2 r1.initializer_ready r5.initializer_ready into r54;
    ternary r2 r1.player_ready r5.player_ready into r55;
    cast r6 r7 r13 r19 r52 r53 r54 r55 into r56 as Table;
    output r56 as Table.private;


function hit:


function stand:


function update_score:
    input r0 as field.private;
    input r1 as u64.private;
    assert.eq self.caller self.signer;
    async update_score r0 r1 into r2;
    output r2 as blockjack.aleo/update_score.future;

finalize update_score:
    input r0 as field.public;
    input r1 as u64.public;
    cast 0u64 0u64 into r2 as User;
    get.or_use users[r0] r2 into r3;
    add r3.score r1 into r4;
    add r3.games_played 1u64 into r5;
    cast r4 r5 into r6 as User;
    set r6 into users[r0];
