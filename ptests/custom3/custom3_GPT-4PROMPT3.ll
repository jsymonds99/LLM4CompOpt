; ModuleID = 'custom3_unoptimized.ll'
source_filename = "custom3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Original Matrix:\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Manipulated Matrix:\0A\00", align 1
@str = private unnamed_addr constant [17 x i8] c"Original Matrix:\00", align 1
@str.1 = private unnamed_addr constant [20 x i8] c"Manipulated Matrix:\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printMatrix(ptr noundef %0) #0 {
.lr.ph2:
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph2, %._crit_edge
  %.08 = phi i32 [ 0, %.lr.ph2 ], [ %9, %._crit_edge ]
  br label %1

1:                                                ; preds = %.lr.ph, %1
  %.0 = phi i32 [ 0, %.lr.ph ], [ %7, %1 ]
  %2 = sext i32 %.08 to i64
  %3 = sext i32 %.0 to i64
  %4 = getelementptr inbounds [5 x i32], ptr %0, i64 %2, i64 %3
  %5 = load i32, ptr %4, align 4
  %6 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %5) #4
  %7 = add nsw i32 %.0, 1
  %8 = icmp slt i32 %.0, 4
  br i1 %8, label %1, label %._crit_edge, !llvm.loop !6

._crit_edge:                                      ; preds = %1
  %putchar4 = call i32 @putchar(i32 10)
  %9 = add nsw i32 %.08, 1
  %10 = icmp slt i32 %.08, 4
  br i1 %10, label %.lr.ph, label %._crit_edge3, !llvm.loop !8

._crit_edge3:                                     ; preds = %._crit_edge
  %putchar = call i32 @putchar(i32 10)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @manipulateMatrix(ptr noundef %0) #0 {
.lr.ph14:
  br label %.lr.ph11

.lr.ph11:                                         ; preds = %.lr.ph14, %._crit_edge12
  %.045 = phi i32 [ 0, %.lr.ph14 ], [ %29, %._crit_edge12 ]
  br label %.lr.ph8

.lr.ph8:                                          ; preds = %.lr.ph11, %._crit_edge9
  %.044 = phi i32 [ 0, %.lr.ph11 ], [ %27, %._crit_edge9 ]
  %.phi.trans.insert = sext i32 %.045 to i64
  %.phi.trans.insert46 = sext i32 %.044 to i64
  %.phi.trans.insert47 = getelementptr inbounds [5 x i32], ptr %0, i64 %.phi.trans.insert, i64 %.phi.trans.insert46
  %.pre = load i32, ptr %.phi.trans.insert47, align 4
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %.lr.ph8, %._crit_edge6
  %1 = phi i32 [ %.pre, %.lr.ph8 ], [ %19, %._crit_edge6 ]
  %.043 = phi i32 [ 0, %.lr.ph8 ], [ %25, %._crit_edge6 ]
  %2 = add nsw i32 %1, %.043
  store i32 %2, ptr %.phi.trans.insert47, align 4
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %.lr.ph5, %._crit_edge3
  %3 = phi i32 [ %2, %.lr.ph5 ], [ %19, %._crit_edge3 ]
  %.042 = phi i32 [ 0, %.lr.ph5 ], [ %4, %._crit_edge3 ]
  %4 = add nsw i32 %.042, 1
  %5 = mul nsw i32 %3, %4
  store i32 %5, ptr %.phi.trans.insert47, align 4
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph2, %._crit_edge
  %6 = phi i32 [ %5, %.lr.ph2 ], [ %19, %._crit_edge ]
  %.041 = phi i32 [ 0, %.lr.ph2 ], [ %22, %._crit_edge ]
  %7 = add nsw i32 %.044, %.045
  %8 = mul nsw i32 %7, %.041
  %9 = sub nsw i32 %6, %8
  store i32 %9, ptr %.phi.trans.insert47, align 4
  br label %10

10:                                               ; preds = %.lr.ph, %18
  %11 = phi i32 [ %9, %.lr.ph ], [ %19, %18 ]
  %.0 = phi i32 [ 0, %.lr.ph ], [ %20, %18 ]
  %12 = and i32 %.0, 1
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %10
  %15 = add nsw i32 %11, %.0
  store i32 %15, ptr %.phi.trans.insert47, align 4
  br label %18

16:                                               ; preds = %10
  %17 = sub nsw i32 %11, %.0
  store i32 %17, ptr %.phi.trans.insert47, align 4
  br label %18

18:                                               ; preds = %14, %16
  %19 = phi i32 [ %15, %14 ], [ %17, %16 ]
  %20 = add nsw i32 %.0, 1
  %21 = icmp slt i32 %.0, 4
  br i1 %21, label %10, label %._crit_edge, !llvm.loop !9

._crit_edge:                                      ; preds = %18
  %22 = add nsw i32 %.041, 1
  %23 = icmp slt i32 %.041, 4
  br i1 %23, label %.lr.ph, label %._crit_edge3, !llvm.loop !10

._crit_edge3:                                     ; preds = %._crit_edge
  %24 = icmp slt i32 %.042, 4
  br i1 %24, label %.lr.ph2, label %._crit_edge6, !llvm.loop !11

._crit_edge6:                                     ; preds = %._crit_edge3
  %25 = add nsw i32 %.043, 1
  %26 = icmp slt i32 %.043, 4
  br i1 %26, label %.lr.ph5, label %._crit_edge9, !llvm.loop !12

._crit_edge9:                                     ; preds = %._crit_edge6
  %27 = add nsw i32 %.044, 1
  %28 = icmp slt i32 %.044, 4
  br i1 %28, label %.lr.ph8, label %._crit_edge12, !llvm.loop !13

._crit_edge12:                                    ; preds = %._crit_edge9
  %29 = add nsw i32 %.045, 1
  %30 = icmp slt i32 %.045, 4
  br i1 %30, label %.lr.ph11, label %._crit_edge15, !llvm.loop !14

._crit_edge15:                                    ; preds = %._crit_edge12
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
.lr.ph2:
  %0 = alloca [5 x [5 x i32]], align 16
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph2, %._crit_edge
  %.08 = phi i32 [ 0, %.lr.ph2 ], [ %9, %._crit_edge ]
  br label %1

1:                                                ; preds = %.lr.ph, %1
  %.0 = phi i32 [ 0, %.lr.ph ], [ %7, %1 ]
  %2 = call i32 @rand() #4
  %3 = srem i32 %2, 10
  %4 = sext i32 %.08 to i64
  %5 = sext i32 %.0 to i64
  %6 = getelementptr inbounds [5 x [5 x i32]], ptr %0, i64 0, i64 %4, i64 %5
  store i32 %3, ptr %6, align 4
  %7 = add nsw i32 %.0, 1
  %8 = icmp slt i32 %.0, 4
  br i1 %8, label %1, label %._crit_edge, !llvm.loop !15

._crit_edge:                                      ; preds = %1
  %9 = add nsw i32 %.08, 1
  %10 = icmp slt i32 %.08, 4
  br i1 %10, label %.lr.ph, label %._crit_edge3, !llvm.loop !16

._crit_edge3:                                     ; preds = %._crit_edge
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @printMatrix(ptr noundef nonnull %0)
  call void @manipulateMatrix(ptr noundef nonnull %0)
  %puts4 = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @printMatrix(ptr noundef nonnull %0)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
