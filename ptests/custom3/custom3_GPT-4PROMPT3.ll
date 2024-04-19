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
  br label %2

2:                                                ; preds = %11, %1
  %lsr.iv = phi ptr [ %scevgep, %11 ], [ %0, %1 ]
  %.01 = phi i32 [ %12, %11 ], [ 0, %1 ]
  %3 = icmp ult i32 %.01, 5
  br i1 %3, label %4, label %13

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %7, %4
  %lsr.iv2 = phi i64 [ %lsr.iv.next, %7 ], [ 0, %4 ]
  %tmp = trunc i64 %lsr.iv2 to i32
  %6 = icmp slt i32 %tmp, 5
  br i1 %6, label %7, label %11

7:                                                ; preds = %5
  %8 = shl nuw nsw i64 %lsr.iv2, 2
  %scevgep3 = getelementptr i8, ptr %lsr.iv, i64 %8
  %9 = load i32, ptr %scevgep3, align 4
  %10 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %9) #4
  %lsr.iv.next = add nuw nsw i64 %lsr.iv2, 1
  br label %5, !llvm.loop !6

11:                                               ; preds = %5
  %putchar4 = call i32 @putchar(i32 10)
  %12 = add nuw nsw i32 %.01, 1
  %scevgep = getelementptr i8, ptr %lsr.iv, i64 20
  br label %2, !llvm.loop !8

13:                                               ; preds = %2
  %putchar = call i32 @putchar(i32 10)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @manipulateMatrix(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %47, %1
  %.01 = phi i32 [ 0, %1 ], [ %48, %47 ]
  %3 = icmp ult i32 %.01, 5
  br i1 %3, label %4, label %49

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %45, %4
  %.02 = phi i32 [ 0, %4 ], [ %46, %45 ]
  %6 = icmp ult i32 %.02, 5
  br i1 %6, label %7, label %47

7:                                                ; preds = %5
  br label %8

8:                                                ; preds = %43, %7
  %.03 = phi i32 [ 0, %7 ], [ %44, %43 ]
  %9 = icmp ult i32 %.03, 5
  br i1 %9, label %10, label %45

10:                                               ; preds = %8
  %11 = zext i32 %.01 to i64
  %12 = zext i32 %.02 to i64
  %13 = getelementptr inbounds [5 x i32], ptr %0, i64 %11, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, %.03
  store i32 %15, ptr %13, align 4
  br label %16

16:                                               ; preds = %42, %10
  %17 = phi i32 [ %15, %10 ], [ %23, %42 ]
  %.04 = phi i32 [ 0, %10 ], [ %20, %42 ]
  %18 = icmp ult i32 %.04, 5
  br i1 %18, label %19, label %43

19:                                               ; preds = %16
  %20 = add nuw nsw i32 %.04, 1
  %21 = mul nsw i32 %17, %20
  store i32 %21, ptr %13, align 4
  br label %22

22:                                               ; preds = %40, %19
  %23 = phi i32 [ %21, %19 ], [ %30, %40 ]
  %.05 = phi i32 [ 0, %19 ], [ %41, %40 ]
  %24 = icmp ult i32 %.05, 5
  br i1 %24, label %25, label %42

25:                                               ; preds = %22
  %26 = add nuw nsw i32 %.01, %.02
  %27 = mul nsw i32 %.05, %26
  %28 = sub nsw i32 %23, %27
  store i32 %28, ptr %13, align 4
  br label %29

29:                                               ; preds = %37, %25
  %30 = phi i32 [ %38, %37 ], [ %28, %25 ]
  %lsr.iv = phi i32 [ %lsr.iv.next, %37 ], [ 0, %25 ]
  %.0 = phi i32 [ %39, %37 ], [ 0, %25 ]
  %31 = icmp ult i32 %.0, 5
  br i1 %31, label %32, label %40

32:                                               ; preds = %29
  %33 = and i32 %.0, 1
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %32
  br label %37

36:                                               ; preds = %32
  br label %37

37:                                               ; preds = %36, %35
  %lsr.iv.pn = phi i32 [ %lsr.iv, %36 ], [ %.0, %35 ]
  %38 = add i32 %lsr.iv.pn, %30
  store i32 %38, ptr %13, align 4
  %39 = add nuw nsw i32 %.0, 1
  %lsr.iv.next = add nsw i32 %lsr.iv, -1
  br label %29, !llvm.loop !9

40:                                               ; preds = %29
  %41 = add nuw nsw i32 %.05, 1
  br label %22, !llvm.loop !10

42:                                               ; preds = %22
  br label %16, !llvm.loop !11

43:                                               ; preds = %16
  %44 = add nuw nsw i32 %.03, 1
  br label %8, !llvm.loop !12

45:                                               ; preds = %8
  %46 = add nuw nsw i32 %.02, 1
  br label %5, !llvm.loop !13

47:                                               ; preds = %5
  %48 = add nuw nsw i32 %.01, 1
  br label %2, !llvm.loop !14

49:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  br label %2

2:                                                ; preds = %11, %0
  %lsr.iv = phi ptr [ %scevgep, %11 ], [ %1, %0 ]
  %.01 = phi i32 [ %12, %11 ], [ 0, %0 ]
  %3 = icmp ult i32 %.01, 5
  br i1 %3, label %4, label %13

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %7, %4
  %lsr.iv2 = phi i64 [ %lsr.iv.next, %7 ], [ 0, %4 ]
  %tmp = trunc i64 %lsr.iv2 to i32
  %6 = icmp slt i32 %tmp, 5
  br i1 %6, label %7, label %11

7:                                                ; preds = %5
  %8 = call i32 @rand() #4
  %9 = srem i32 %8, 10
  %10 = shl nuw nsw i64 %lsr.iv2, 2
  %scevgep3 = getelementptr i8, ptr %lsr.iv, i64 %10
  store i32 %9, ptr %scevgep3, align 4
  %lsr.iv.next = add nuw nsw i64 %lsr.iv2, 1
  br label %5, !llvm.loop !15

11:                                               ; preds = %5
  %12 = add nuw nsw i32 %.01, 1
  %scevgep = getelementptr i8, ptr %lsr.iv, i64 20
  br label %2, !llvm.loop !16

13:                                               ; preds = %2
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @printMatrix(ptr noundef nonnull %1)
  call void @manipulateMatrix(ptr noundef nonnull %1)
  %puts4 = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @printMatrix(ptr noundef nonnull %1)
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
